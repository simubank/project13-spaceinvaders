package ca.td.td4m3.components.stackedView

import android.view.View

data class StackedViewDataSource(
        val title: String,
        val content: String,
        val clickListener: View.OnClickListener? = null)