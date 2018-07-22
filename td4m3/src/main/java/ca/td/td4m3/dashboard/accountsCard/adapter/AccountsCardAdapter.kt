package ca.td.td4m3.dashboard.accountsCard.adapter

import ca.td.td4m3.components.shimmer.binder.ShimmerBinder
import com.ngam.rvabstractions.AbstractDataBindAdapter

class AccountsCardAdapter: AbstractDataBindAdapter() {
    override fun buildRows() {
        add(ShimmerBinder())
    }
}