package ca.td.td4m3.dashboard.creditCard.cardView

import android.content.Context
import android.util.AttributeSet
import ca.td.td4m3.components.genericCard.CardDataSource
import ca.td.td4m3.components.genericCard.GenericCardView
import ca.td.td4m3.dashboard.creditCard.adapter.MortgageAdapter
import ca.td.td4m3.dashboard.creditCard.presenter.MortgagePresenter

class MortgageCardView(
        context: Context, attrSet: AttributeSet?, defStyleAttr: Int):
        GenericCardView<MortgagePresenter, MortgageAdapter>(context, attrSet, defStyleAttr) {

    // Constructors for LinearLayout
    constructor(context: Context, attrSet: AttributeSet?): this(context, attrSet, 0)
    constructor(context: Context): this(context, null)

    override fun setDataSource(): CardDataSource<MortgagePresenter, MortgageAdapter> {
        presenter = MortgagePresenter()
        adapter = MortgageAdapter()
        return CardDataSource(presenter, adapter, "TD MyMortgage")
    }
}