package ca.td.td4m3.mortgage.adapter

import ca.td.td4m3.R
import ca.td.td4m3.components.mortgage.binder.MortgageBinder
import ca.td.td4m3.mortgage.presenter.MortgageActivityPresenter
import com.ngam.rvabstractions.AbstractDataBindAdapter

class MortgageActivityAdapter(val presenter: MortgageActivityPresenter) : AbstractDataBindAdapter() {

    override fun buildRows() {
        add(MortgageBinder(R.drawable.mortgage_calculator, "Mortgage Calculator",
                presenter.getMortgageCalculatorActivity()))
    }
}