package ca.td.td4m3.components.mortgage.binder

import android.view.View
import android.view.ViewGroup
import ca.td.td4m3.R
import ca.td.td4m3.components.mortgage.viewholder.MortgageViewHolder
import com.ngam.rvabstractions.AbstractDataBinder

class MortgageBinder(private val listener: View.OnClickListener): AbstractDataBinder<MortgageViewHolder>() {

    override fun createViewHolder(parent: ViewGroup): MortgageViewHolder {
        return MortgageViewHolder(getView(MortgageViewHolder.getLayoutId(), parent))
    }

    override fun bindViewHolder(viewHolder: MortgageViewHolder) {
        viewHolder.imageView.setBackgroundResource(R.drawable.mortgage_picture)
        viewHolder.imageView.invalidate()
        viewHolder.imageView.setOnClickListener(listener)
    }
}