package ca.td.td4m3.components.pieChart.viewHolder

import android.support.annotation.LayoutRes
import android.support.v7.widget.RecyclerView
import android.view.View
import ca.td.td4m3.R
import com.github.mikephil.charting.charts.PieChart

class SpendingPieChartViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    var pieChart: PieChart = itemView.findViewById(R.id.spending_half_pie_chart)

    companion object {
        @LayoutRes
        fun getLayoutId(): Int {
            return R.layout.pie_chart_spending
        }
    }
}