package ca.td.td4m3.components.accountsCardRow

import android.view.ViewGroup
import com.ngam.rvabstractions.AbstractDataBinder

class AccountsRowBinder(val text: String): AbstractDataBinder<AccountsRowViewHolder>() {

    override fun createViewHolder(parent: ViewGroup): AccountsRowViewHolder {
        return AccountsRowViewHolder(getView(AccountsRowViewHolder.getLayoutId(), parent))
    }

    override fun bindViewHolder(viewHolder: AccountsRowViewHolder) {
        viewHolder.textView.text = this.text
    }



}