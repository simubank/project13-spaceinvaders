package ca.td.td4m3.dashboard.creditCard.cardView

import android.content.Context
import android.util.AttributeSet
import ca.td.td4m3.Constants
import ca.td.td4m3.components.genericCard.CardDataSource
import ca.td.td4m3.components.genericCard.GenericCardView
import ca.td.td4m3.dashboard.creditCard.adapter.CreditCardAdapter
import ca.td.td4m3.dashboard.creditCard.contract.CreditCardView
import ca.td.td4m3.dashboard.creditCard.presenter.CreditCardPresenter
import com.td.virtualbank.VirtualBank
import com.td.virtualbank.VirtualBankAccount

class CreditCardCardView(
        context: Context, attrSet: AttributeSet?, defStyleAttr: Int):
        GenericCardView<CreditCardPresenter, CreditCardAdapter>(context, attrSet, defStyleAttr), CreditCardView {
    // Constructors for LinearLayout
    constructor(context: Context, attrSet: AttributeSet?): this(context, attrSet, 0)
    constructor(context: Context): this(context, null)

    override fun setDataSource(): CardDataSource<CreditCardPresenter, CreditCardAdapter> {
        presenter = CreditCardPresenter(this)
        adapter = CreditCardAdapter(presenter)
        return CardDataSource(presenter, adapter, "Credit Card Spending: ")
    }

    override fun reloadView() {
        adapter.reload()
    }

    override fun requestAccounts() {
        // Cannot make bank or id global because they don't get instantiated before this is called.
        val bank: VirtualBank = VirtualBank.getBank(Constants.AUTH_TOKEN)
        val customerID: String = Constants.RUE_CHRISTOFFERSE_ID
        bank.getCustomerAccounts(context, customerID, presenter.getAccountHandler())
    }

    override fun requestTransactionsForAccount(account: VirtualBankAccount) {
        val bank: VirtualBank = VirtualBank.getBank(Constants.AUTH_TOKEN)
        bank.getTransactions(context, account.id, presenter.getTransactionsHandler(account))
    }
}