package ca.td.td4m3.dashboard.mortgage.cardView

import android.content.Context
import android.content.Intent
import android.util.AttributeSet
import ca.td.td4m3.R
import ca.td.td4m3.components.genericCard.CardDataSource
import ca.td.td4m3.components.genericCard.GenericCardView
import ca.td.td4m3.dashboard.mortgage.adapter.MortgageAdapter
import ca.td.td4m3.dashboard.mortgage.contract.MortgageView
import ca.td.td4m3.dashboard.mortgage.presenter.MortgagePresenter
import ca.td.td4m3.mortgage.activity.MortgageActivity

class MortgageCardView(
        context: Context, attrSet: AttributeSet?, defStyleAttr: Int):
        GenericCardView<MortgagePresenter, MortgageAdapter>(context, attrSet, defStyleAttr), MortgageView {

    // Constructors for LinearLayout
    constructor(context: Context, attrSet: AttributeSet?): this(context, attrSet, 0)
    constructor(context: Context): this(context, null)

    override fun setDataSource(): CardDataSource<MortgagePresenter, MortgageAdapter> {
        presenter = MortgagePresenter(this)
        adapter = MortgageAdapter(presenter)
        return CardDataSource(presenter, adapter, context.getString(R.string.td_mortgage_cd))
    }

    override fun launchMortgageActivity() {
        val intent = Intent(context, MortgageActivity::class.java)
        context.startActivity(intent)
    }
}