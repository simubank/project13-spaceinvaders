package ca.td.td4m3.components.crditCardRowItem.binder

import android.view.View
import android.view.ViewGroup
import ca.td.td4m3.components.crditCardRowItem.CreditCardRowItemDataSource
import ca.td.td4m3.components.crditCardRowItem.viewholder.CreditCardRowItemViewHolder
import ca.td.td4m3.components.stackedView.StackedView
import ca.td.td4m3.components.stackedView.StackedViewDataSource
import com.ngam.rvabstractions.AbstractDataBinder

class CreditCardRowItemBinder(private val dataSourceCredit: CreditCardRowItemDataSource): AbstractDataBinder<CreditCardRowItemViewHolder>() {
    override fun createViewHolder(parent: ViewGroup): CreditCardRowItemViewHolder {
        return CreditCardRowItemViewHolder(getView(CreditCardRowItemViewHolder.getLayoutId(), parent))
    }

    override fun bindViewHolder(viewHolder: CreditCardRowItemViewHolder) {
        viewHolder.creditCardImage.setImageResource(dataSourceCredit.cardImageRes)
        viewHolder.creditCardName.text = dataSourceCredit.cardName
        viewHolder.cardDescriptionText.text = dataSourceCredit.cardDescription
        bindAllSubViews(viewHolder)
        viewHolder.fourthInformation.content.textSize = 20f

        viewHolder.cardParent.setOnClickListener {
            viewHolder.expandableLayout.toggle()
        }
    }

    private fun bindAllSubViews(viewHolder: CreditCardRowItemViewHolder) {
        bindSubView(viewHolder.firstInformation, dataSourceCredit.firstInformationDataSource, viewHolder)
        bindSubView(viewHolder.secondInformation, dataSourceCredit.secondInformationDataSource, viewHolder)
        bindSubView(viewHolder.thirdInformation, dataSourceCredit.thirdInformationDataSource, viewHolder)
        bindSubView(viewHolder.fourthInformation, dataSourceCredit.fourthInformationDataSource, viewHolder)
    }

    private fun bindSubView(view: StackedView, dataSource: StackedViewDataSource?, viewHolder: CreditCardRowItemViewHolder) {
        view.title.text = dataSource?.title ?: ""
        view.content.text = dataSource?.content ?: ""
        view.parentView.setOnClickListener(dataSource?.clickListener ?: getExpandingClickListener(viewHolder))
    }

    private fun getExpandingClickListener(viewHolder: CreditCardRowItemViewHolder): View.OnClickListener {
        return View.OnClickListener {
            viewHolder.expandableLayout.toggle()
        }
    }
}