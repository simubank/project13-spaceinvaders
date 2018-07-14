package ca.td.td4m3.components.pieChart.binder

import android.view.ViewGroup
import ca.td.td4m3.components.pieChart.viewHolder.SpendingPieChartViewHolder
import com.github.mikephil.charting.data.PieData
import com.github.mikephil.charting.data.PieDataSet
import com.github.mikephil.charting.data.PieEntry
import com.ngam.rvabstractions.AbstractDataBinder

class SpendingPieChartBinder: AbstractDataBinder<SpendingPieChartViewHolder>() {
    override fun createViewHolder(parent: ViewGroup): SpendingPieChartViewHolder {
        return SpendingPieChartViewHolder(getView(SpendingPieChartViewHolder.getLayoutId(), parent))
    }

    override fun bindViewHolder(viewHolder: SpendingPieChartViewHolder) {
        // TODO: Implement real data
        val entries: ArrayList<PieEntry> = ArrayList()

        entries.add(PieEntry(73f, "Saving"))
        entries.add(PieEntry(27f, "Spending"))

        viewHolder.pieChart.data = PieData(PieDataSet(entries, "Saving v Spending"))
        viewHolder.pieChart.invalidate()
    }

}