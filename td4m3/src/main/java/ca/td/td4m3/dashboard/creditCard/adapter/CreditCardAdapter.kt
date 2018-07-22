package ca.td.td4m3.dashboard.creditCard.adapter

import ca.td.td4m3.components.accountsCardRow.AccountsRowBinder
import ca.td.td4m3.components.creditCardSpendingRow.binder.CreditCardLoadedRowBinder
import ca.td.td4m3.components.shimmer.binder.ShimmerBinder
import ca.td.td4m3.dashboard.creditCard.presenter.CreditCardPresenter
import com.ngam.rvabstractions.AbstractDataBindAdapter

class CreditCardAdapter(val presenter: CreditCardPresenter): AbstractDataBindAdapter() {
    override fun buildRows() {
        listItems.clear()
        if (presenter.getCardState() == CreditCardPresenter.CreditCardState.SHIMMER) {
            add(ShimmerBinder())
            return
        }

        if (presenter.getCardState() == CreditCardPresenter.CreditCardState.FULL_ERROR) {
            add(AccountsRowBinder("Sorry! Something went wrong when trying to get your credit card details!"))
            return
        }

        if (presenter.getCardState() == CreditCardPresenter.CreditCardState.PARTIAL_ERROR) {
            add(AccountsRowBinder("You seem to have no credit card accounts! Click here to find out about our products!"))
            return
        }

        add(CreditCardLoadedRowBinder(String.format("$%.2f", presenter.calculateSpending())))
        presenter.getMostPopularVendor()
    }
}