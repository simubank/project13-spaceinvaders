package ca.td.td4m3.components.mortgage.viewholder

import android.support.annotation.LayoutRes
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import ca.td.td4m3.R

class MortgageViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    var imageView: ImageView = itemView.findViewById(R.id.mortgage_image_view)
    var textView: TextView = itemView.findViewById(R.id.mortgage_text_view)

    companion object {
        @LayoutRes
        fun getLayoutId() :Int {
            return R.layout.td_mortgage_view
        }
    }
}