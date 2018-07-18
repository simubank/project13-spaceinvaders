package ca.td.td4m3.components.accountsCardRow

import android.support.annotation.LayoutRes
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.TextView
import ca.td.td4m3.R

class AccountsRowViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    var textView: TextView = itemView.findViewById(R.id.accountsRowId)

    companion object {
        @LayoutRes
        fun getLayoutId(): Int {
            return R.layout.accounts_dashboard_view
        }
    }
}