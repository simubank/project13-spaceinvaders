package ca.td.td4m3.components.crditCardRowItem.viewholder

import android.support.annotation.LayoutRes
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.ImageView
import android.widget.RelativeLayout
import android.widget.TextView
import ca.td.td4m3.R
import ca.td.td4m3.components.stackedView.StackedView
import net.cachapa.expandablelayout.ExpandableLayout

class CreditCardRowItemViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    val cardParent: RelativeLayout = itemView.findViewById(R.id.cardRow)
    val expandableLayout: ExpandableLayout = itemView.findViewById(R.id.expandableLayout)
    val creditCardImage: ImageView = itemView.findViewById(R.id.credit_card_image_view)
    val creditCardName: TextView = itemView.findViewById(R.id.credit_card_card_name)
    val cardDescriptionText: TextView = itemView.findViewById(R.id.cc_information_text)
    val firstInformation: StackedView = itemView.findViewById(R.id.firstInformation)
    val secondInformation: StackedView = itemView.findViewById(R.id.secondInformation)
    val thirdInformation: StackedView = itemView.findViewById(R.id.thirdInformation)
    val fourthInformation: StackedView = itemView.findViewById(R.id.fourthInformation)

    companion object {
        @LayoutRes
        fun getLayoutId(): Int {
            return R.layout.credit_card_information_expandable_cell
        }
    }
}