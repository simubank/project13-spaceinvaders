package ca.td.td4m3.mortgage.activity

import ca.td.td4m3.R
import ca.td.td4m3.mortgage.adapter.MortgageActivityAdapter
import ca.td.td4m3.mortgage.presenter.MortgageActivityPresenter
import ca.td.td4m3.mortgage.view.MortgageActivityView
import com.ngam.rvabstractions.AbstractActivity
import com.ngam.rvabstractions.AbstractClassProperties

class MortgageActivity : AbstractActivity<MortgageActivityPresenter, MortgageActivityAdapter>(),
        MortgageActivityView {

    override fun onResume() {
        super.onResume()
        val padding = resources.getDimensionPixelOffset(R.dimen.card_top_spacing)
        window.decorView.setBackgroundColor(getColor(R.color.grey))
        listView.setPadding(0, padding, 0, 0)
    }

    override fun setProperties(): AbstractClassProperties<MortgageActivityPresenter,
            MortgageActivityAdapter> {
        presenter = MortgageActivityPresenter(this)
        adapter = MortgageActivityAdapter(presenter)
        return AbstractClassProperties(presenter, adapter, "")
    }

    override fun getMortgageCalculatorActivity() {
    }
}