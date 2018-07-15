package ca.td.td4m3.activities

import ca.td.td4m3.dashboard.creditCard.adapter.MortgageAdapter
import ca.td.td4m3.dashboard.creditCard.presenter.MortgagePresenter
import com.ngam.rvabstractions.AbstractActivity
import com.ngam.rvabstractions.AbstractClassProperties

class MortgageActivity: AbstractActivity<MortgagePresenter, MortgageAdapter>(){

    override fun setProperties(): AbstractClassProperties<MortgagePresenter, MortgageAdapter> {
        presenter = MortgagePresenter()
        adapter = MortgageAdapter()
        return AbstractClassProperties(presenter, adapter, "TD MyMortgage")
    }
}