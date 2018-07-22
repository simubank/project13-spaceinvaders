package ca.td.td4m3.components.shimmer.viewholder

import android.support.annotation.LayoutRes
import android.support.v7.widget.RecyclerView
import android.view.View
import ca.td.td4m3.R
import com.facebook.shimmer.ShimmerFrameLayout

class ShimmerViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    val shimmerCard: ShimmerFrameLayout = itemView.findViewById(R.id.card_shimmer)
    companion object {
        @LayoutRes
        fun getLayoutId(): Int {
            return R.layout.shimmer_card
        }
    }
}