package ca.td.td4m3.creditCards.adapter

import android.content.Context
import ca.td.td4m3.components.crditCardRowItem.binder.CreditCardRowItemBinder
import ca.td.td4m3.components.shimmer.binder.ShimmerBinder
import ca.td.td4m3.creditCards.CreditCards
import ca.td.td4m3.creditCards.presenter.CreditCardScreenPresenter
import com.ngam.rvabstractions.AbstractDataBindAdapter

class CreditCardsScreenAdapter(val presenter: CreditCardScreenPresenter, val context: Context): AbstractDataBindAdapter() {
    override fun buildRows() {
        listItems.clear()

        if (presenter.shouldShowShimmer()) {
            addShimmers()
            return
        }

        add(CreditCardRowItemBinder(CreditCards.getTDCashBackVisaInfiniteCard(context)))
        add(CreditCardRowItemBinder(CreditCards.getTDCashBackVisaCard(context)))
        add(CreditCardRowItemBinder(CreditCards.getTDFreeRewardsCard(context)))
        add(CreditCardRowItemBinder(CreditCards.getTDPlatinumTravelVisa(context)))
    }

    private fun addShimmers() {
        // Add 10 shimmer if should be shown
        for (i in 1..10) {
            add(ShimmerBinder())
        }
    }
}