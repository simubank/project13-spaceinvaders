package ca.td.td4m3.components.pieChart.binder

import android.view.ViewGroup
import ca.td.td4m3.components.pieChart.styles.PieChartStyles
import ca.td.td4m3.components.pieChart.viewHolder.SpendingPieChartViewHolder
import com.github.mikephil.charting.animation.Easing
import com.github.mikephil.charting.data.PieData
import com.github.mikephil.charting.data.PieDataSet
import com.github.mikephil.charting.data.PieEntry
import com.ngam.rvabstractions.AbstractDataBinder

class SpendingPieChartBinder: AbstractDataBinder<SpendingPieChartViewHolder>() {
    override fun createViewHolder(parent: ViewGroup): SpendingPieChartViewHolder {
        return SpendingPieChartViewHolder(getView(SpendingPieChartViewHolder.getLayoutId(), parent))
    }

    override fun bindViewHolder(viewHolder: SpendingPieChartViewHolder) {
        // Set Chart Style
        PieChartStyles.setTdPieChartProperties(viewHolder.pieChart)
        // TODO: Implement real data
        val entries: ArrayList<PieEntry> = ArrayList()

        entries.add(PieEntry(73f, "Saving"))
        entries.add(PieEntry(27f, "Spending"))

        val pieDataSet: PieDataSet = PieDataSet(entries, "Saving v Spending")
        PieChartStyles.setTdDataSetColors(viewHolder.pieChart, pieDataSet)
        viewHolder.pieChart.data = PieData(pieDataSet)
        viewHolder.pieChart.invalidate()
        viewHolder.pieChart.animateY(1000, Easing.EasingOption.Linear)
    }

}