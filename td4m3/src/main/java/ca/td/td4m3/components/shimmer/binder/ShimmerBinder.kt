package ca.td.td4m3.components.shimmer.binder

import android.animation.ValueAnimator
import android.view.ViewGroup
import ca.td.td4m3.components.shimmer.viewholder.ShimmerViewHolder
import com.facebook.shimmer.Shimmer
import com.ngam.rvabstractions.AbstractDataBinder

class ShimmerBinder: AbstractDataBinder<ShimmerViewHolder>() {
    override fun createViewHolder(parent: ViewGroup): ShimmerViewHolder {
        return ShimmerViewHolder(getView(ShimmerViewHolder.getLayoutId(), parent))
    }

    override fun bindViewHolder(viewHolder: ShimmerViewHolder) {
        val shimmer: Shimmer = Shimmer.AlphaHighlightBuilder().setAutoStart(true)
                .setDuration(2000L)
                .setDropoff(0.1f)
                .setRepeatMode(ValueAnimator.RESTART)
                .build()
        viewHolder.shimmerCard.setShimmer(shimmer)
        viewHolder.shimmerCard.startShimmer()
    }
}