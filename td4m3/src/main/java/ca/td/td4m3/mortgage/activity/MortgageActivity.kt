package ca.td.td4m3.mortgage.activity

import ca.td.td4m3.mortgage.adapter.MortgageActivityAdapter
import ca.td.td4m3.mortgage.presenter.MortgageActivityPresenter
import com.ngam.rvabstractions.AbstractActivity
import com.ngam.rvabstractions.AbstractClassProperties

class MortgageActivity: AbstractActivity<MortgageActivityPresenter, MortgageActivityAdapter>(){

    override fun setProperties(): AbstractClassProperties<MortgageActivityPresenter, MortgageActivityAdapter> {
        presenter = MortgageActivityPresenter()
        adapter = MortgageActivityAdapter()
        return AbstractClassProperties(presenter, adapter, "")
    }
}