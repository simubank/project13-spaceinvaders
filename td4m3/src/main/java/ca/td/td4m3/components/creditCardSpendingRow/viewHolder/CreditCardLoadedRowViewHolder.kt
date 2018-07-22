package ca.td.td4m3.components.creditCardSpendingRow.viewHolder

import android.support.annotation.LayoutRes
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.TextView
import ca.td.td4m3.R

class CreditCardLoadedRowViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    val nameDetails: TextView = itemView.findViewById(R.id.nameDetails)
    val monthlySpendingText: TextView = itemView.findViewById(R.id.monthlySpendingText)
    val monthlySpendingNumber: TextView = itemView.findViewById(R.id.monthlySpendingNumber)

    companion object {
        @LayoutRes
        fun getLayoutId(): Int {
            return R.layout.credit_card_loaded_row
        }
    }
}