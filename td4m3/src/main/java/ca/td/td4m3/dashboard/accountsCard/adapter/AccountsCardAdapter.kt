package ca.td.td4m3.dashboard.accountsCard.adapter

import ca.td.td4m3.components.accountsCardRow.AccountsRowBinder
import com.ngam.rvabstractions.AbstractDataBindAdapter

class AccountsCardAdapter: AbstractDataBindAdapter() {
    override fun buildRows() {
        add(AccountsRowBinder("See how your accounts are doing"))
    }
}