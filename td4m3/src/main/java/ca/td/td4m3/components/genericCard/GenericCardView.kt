package ca.td.td4m3.components.genericCard

import android.content.Context
import android.support.v7.widget.DefaultItemAnimator
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.util.AttributeSet
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import ca.td.td4m3.R
import com.ngam.rvabstractions.AbstractDataBindAdapter
import com.ngam.rvabstractions.AbstractPresenter

/**
 * This is the generic view used to reduce verbiage when implementing multiple cards.
 * Note: Cards must be added to XML (ViewHolder or otherwise) to properly instantiate.
 */
abstract class GenericCardView<Presenter: AbstractPresenter, Adapter: AbstractDataBindAdapter>(
        context: Context, attrSet: AttributeSet?, defStyleAttr: Int):
        LinearLayout(context, attrSet, defStyleAttr) {
    // Constructors for LinearLayout
    constructor(context: Context, attrSet: AttributeSet?): this(context, attrSet, 0)
    constructor(context: Context): this(context, null)

    protected var dataSource: CardDataSource<Presenter, Adapter>
    protected lateinit var presenter: Presenter
    protected lateinit var adapter: Adapter

    protected var cardListView: RecyclerView
    protected var cardTextView: TextView

    init {
        val inflater: LayoutInflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        inflater.inflate(R.layout.generic_card_view, this, true)
        dataSource = setDataSource()

        cardTextView = findViewById(R.id.cardTitle)
        if (dataSource.cardTitle.isNullOrEmpty()) {
            cardTextView.visibility = View.GONE
        } else {
            cardTextView.visibility = View.VISIBLE
            cardTextView.text = dataSource.cardTitle
            cardTextView.setOnClickListener(dataSource.cardClickListener)
        }

        cardListView = findViewById(R.id.cardListView)
        cardListView.layoutManager = LinearLayoutManager(getContext())
        cardListView.itemAnimator = DefaultItemAnimator()
        cardListView.adapter = adapter

        adapter.buildRows()

        presenter.onViewReady()
        cardListView.requestFocus()
    }

    protected abstract fun setDataSource(): CardDataSource<Presenter, Adapter>
}