package ca.td.td4m3.creditCards.presenter

import ca.td.td4m3.creditCards.view.CreditCardScreenView
import com.android.volley.VolleyError
import com.ngam.rvabstractions.AbstractPresenter
import com.td.virtualbank.*

class CreditCardScreenPresenter(val view: CreditCardScreenView): AbstractPresenter() {
    private var accountTransactionsMap: HashMap<VirtualBankAccount, ArrayList<VirtualBankTransaction>> = HashMap()
    private var shouldShowShimmer: Boolean = true

    override fun onViewReady() {
        // Cannot request just CC because requesting transactions requires different object
        view.requestAccounts()
    }

    fun getAccountHandler(): VirtualBankGetCustomerAccountsRequest {
        return object: VirtualBankGetCustomerAccountsRequest() {
            override fun onSuccess(var1: ArrayList<VirtualBankAccount>) {
                val accountList: ArrayList<VirtualBankAccount> = var1
                val ccAccountList: ArrayList<VirtualBankAccount> = getCreditCardAccounts(accountList)
                if (ccAccountList.isEmpty()) {
                    // No CC accounts or transactions. Can only show product data
                    return
                }

                // Make request for transactions for each CC account
                for (account in ccAccountList) {
                    view.requestTransactionsForAccount(account)
                }
            }

            override fun onError(p0: VolleyError?) {
                // Assume user has no accounts
                shouldShowShimmer = false
                view.reloadView()
            }
        }
    }

    private fun getCreditCardAccounts(accountList: ArrayList<VirtualBankAccount>): ArrayList<VirtualBankAccount> {
        val ccAccounts: ArrayList<VirtualBankAccount> = ArrayList()
        for (account in accountList) {
            // Apparently all CCs are just "VISA"
            if (account.type == "VISA") {
                ccAccounts.add(account)
            }
        }
        return ccAccounts
    }

    fun getTransactionsHandler(account: VirtualBankAccount): VirtualBankGetTransactionsRequest {
        shouldShowShimmer = false
        return object: VirtualBankGetTransactionsRequest() {
            override fun onSuccess(var1: ArrayList<VirtualBankTransaction>) {
                accountTransactionsMap[account] = var1
                view.reloadView()
            }

            override fun onError(p0: VolleyError?) {
                // Assume user has no transactions or cannot get
                view.reloadView()
            }
        }
    }

    fun shouldShowShimmer(): Boolean {
        return shouldShowShimmer
    }
}