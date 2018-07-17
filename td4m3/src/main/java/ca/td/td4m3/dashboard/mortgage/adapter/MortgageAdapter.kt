package ca.td.td4m3.dashboard.mortgage.adapter

import ca.td.td4m3.R
import ca.td.td4m3.components.mortgage.binder.MortgageBinder
import ca.td.td4m3.dashboard.mortgage.presenter.MortgagePresenter
import com.ngam.rvabstractions.AbstractDataBindAdapter

class MortgageAdapter(val presenter: MortgagePresenter): AbstractDataBindAdapter() {

    override fun buildRows() {
        add(MortgageBinder(R.drawable.mortgage_picture,"", presenter.createOnClickListener()))
    }
}