package ca.td.td4m3.creditCards.activity

import ca.td.td4m3.Constants
import ca.td.td4m3.creditCards.adapter.CreditCardsScreenAdapter
import ca.td.td4m3.creditCards.presenter.CreditCardScreenPresenter
import ca.td.td4m3.creditCards.view.CreditCardScreenView
import com.ngam.rvabstractions.AbstractActivity
import com.ngam.rvabstractions.AbstractClassProperties
import com.td.virtualbank.*

class CreditCardsScreenActivity: AbstractActivity<CreditCardScreenPresenter, CreditCardsScreenAdapter>(), CreditCardScreenView {
    private val bank: VirtualBank = VirtualBank.getBank(Constants.AUTH_TOKEN)
    private val CUSTOMER_ID: String = Constants.RUE_CHRISTOFFERSE_ID

    override fun setProperties(): AbstractClassProperties<CreditCardScreenPresenter, CreditCardsScreenAdapter> {
        presenter = CreditCardScreenPresenter(this)
        adapter = CreditCardsScreenAdapter(presenter, this)
        return AbstractClassProperties(presenter, adapter, "")
    }

    override fun reloadView() {
        reload()
    }

    override fun requestAccounts() {
        bank.getCustomerAccounts(this, CUSTOMER_ID, presenter.getAccountHandler())
    }

    override fun requestTransactionsForAccount(account: VirtualBankAccount) {
        bank.getTransactions(this, account.id, presenter.getTransactionsHandler(account))
    }
}