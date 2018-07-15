package ca.td.td4m3.dashboard.mortgage.presenter

import android.view.View
import ca.td.td4m3.dashboard.mortgage.contract.MortgageView
import com.ngam.rvabstractions.AbstractPresenter

class MortgagePresenter(val view: MortgageView): AbstractPresenter() {

    fun createOnClickListener(): View.OnClickListener {
        return View.OnClickListener {
            view.launchMortgageActivity()
        }
    }
}