package ca.td.td4m3.dashboard.creditCard.adapter

import ca.td.td4m3.components.mortgage.binder.MortgageBinder
import ca.td.td4m3.dashboard.creditCard.presenter.MortgagePresenter
import com.ngam.rvabstractions.AbstractDataBindAdapter

class MortgageAdapter: AbstractDataBindAdapter() {
    val presenter = MortgagePresenter()

    override fun buildRows() {
        add(MortgageBinder(presenter.getBinderListener()))
    }
}