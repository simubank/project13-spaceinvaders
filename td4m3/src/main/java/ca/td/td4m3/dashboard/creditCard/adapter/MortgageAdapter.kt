package ca.td.td4m3.dashboard.creditCard.adapter

import ca.td.td4m3.components.mortgage.binder.MortgageBinder
import com.ngam.rvabstractions.AbstractDataBindAdapter

class MortgageAdapter: AbstractDataBindAdapter() {
    override fun buildRows() {
        add(MortgageBinder())
    }
}