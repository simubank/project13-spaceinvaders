package ca.td.td4m3.components.pieChart.styles

import android.content.Context
import android.graphics.Color
import ca.td.td4m3.R
import com.github.mikephil.charting.charts.PieChart
import com.github.mikephil.charting.data.PieDataSet

class PieChartStyles private constructor() {
    companion object {
        private const val PIE_CHART_ROTATION_ENABLED: Boolean = true
        private const val PIE_CHART_HOLE_SIZE: Float = 20f
        private const val Y_VALUE_TEXT_SIZE: Float = 12f

        fun setTdPieChartProperties(chart: PieChart) {
            chart.isRotationEnabled = PIE_CHART_ROTATION_ENABLED
            chart.holeRadius = PIE_CHART_HOLE_SIZE
            chart.setEntryLabelColor(Color.BLACK)
        }

        fun setTdDataSetColors(chart: PieChart, dataSet: PieDataSet) {
            // Get Chart Colors
            val context: Context = chart.context
            val tdPieColors: ArrayList<Int> = ArrayList()
            tdPieColors.add(context.getColor(R.color.td_very_light_green))
            tdPieColors.add(context.getColor(R.color.td_light_green))
            dataSet.colors = tdPieColors

            dataSet.xValuePosition = PieDataSet.ValuePosition.INSIDE_SLICE
            dataSet.yValuePosition = PieDataSet.ValuePosition.OUTSIDE_SLICE
            dataSet.valueTextSize = Y_VALUE_TEXT_SIZE
        }
    }
}