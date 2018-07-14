package ca.td.td4m3.dashboard.creditCard.adapter

import ca.td.td4m3.components.pieChart.binder.SpendingPieChartBinder
import com.ngam.rvabstractions.AbstractDataBindAdapter

class CreditCardAdapter: AbstractDataBindAdapter() {
    override fun buildRows() {
        add(SpendingPieChartBinder())
    }
}