package ca.td.td4m3.mortgage.presenter

import android.view.View
import ca.td.td4m3.mortgage.view.MortgageActivityView
import com.ngam.rvabstractions.AbstractPresenter

class MortgageActivityPresenter(val view: MortgageActivityView): AbstractPresenter() {

    fun getMortgageCalculatorActivity(): View.OnClickListener {
        return View.OnClickListener {
            view.getMortgageCalculatorActivity()
        }
    }
}