package ca.td.td4m3.dashboard.creditCard.cardView

import android.content.Context
import android.util.AttributeSet
import ca.td.td4m3.components.genericCard.CardDataSource
import ca.td.td4m3.components.genericCard.GenericCardView
import ca.td.td4m3.dashboard.creditCard.adapter.CreditCardAdapter
import ca.td.td4m3.dashboard.creditCard.presenter.CreditCardPresenter

class CreditCardCardView(
        context: Context, attrSet: AttributeSet?, defStyleAttr: Int):
        GenericCardView<CreditCardPresenter, CreditCardAdapter>(context, attrSet, defStyleAttr) {
    // Constructors for LinearLayout
    constructor(context: Context, attrSet: AttributeSet?): this(context, attrSet, 0)
    constructor(context: Context): this(context, null)

    override fun setDataSource(): CardDataSource<CreditCardPresenter, CreditCardAdapter> {
        presenter = CreditCardPresenter()
        adapter = CreditCardAdapter()
        return CardDataSource(presenter, adapter, "Spending Habits")
    }
}