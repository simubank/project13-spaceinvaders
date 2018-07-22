package ca.td.td4m3.components.creditCardSpendingRow.binder

import android.view.View
import android.view.ViewGroup
import ca.td.td4m3.components.creditCardSpendingRow.viewHolder.CreditCardLoadedRowViewHolder
import com.ngam.rvabstractions.AbstractDataBinder

class CreditCardLoadedRowBinder(
        private val spendingDetailsNumber: String,
        private val spendingDetailsDescription: String = "Your Monthly Spending So Far:",
        private val shouldShowName: Int = View.GONE,
        private val nameDetailsValue: String = ""): AbstractDataBinder<CreditCardLoadedRowViewHolder>() {
    override fun createViewHolder(parent: ViewGroup): CreditCardLoadedRowViewHolder {
        return CreditCardLoadedRowViewHolder(getView(CreditCardLoadedRowViewHolder.getLayoutId(), parent))
    }

    override fun bindViewHolder(viewHolder: CreditCardLoadedRowViewHolder) {
        viewHolder.nameDetails.text = nameDetailsValue
        viewHolder.nameDetails.visibility = shouldShowName
        viewHolder.monthlySpendingText.text = spendingDetailsDescription
        viewHolder.monthlySpendingNumber.text = spendingDetailsNumber
    }
}