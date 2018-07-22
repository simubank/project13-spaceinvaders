package ca.td.td4m3.components.stackedView

import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.widget.RelativeLayout
import android.widget.TextView
import ca.td.td4m3.R

class StackedView(context: Context, attrSet: AttributeSet?, defStyleAttr: Int):
        RelativeLayout(context, attrSet, defStyleAttr) {
    // Constructors for RelativeLayout
    constructor(context: Context, attrSet: AttributeSet?): this(context, attrSet, 0)
    constructor(context: Context): this(context, null)

    var parentView: RelativeLayout
    var title: TextView
    var content: TextView

    init {
        val inflater: LayoutInflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        inflater.inflate(R.layout.stacked_information, this, true)
        parentView = findViewById(R.id.stacked_view_parent_view)
        title = findViewById(R.id.title)
        content = findViewById(R.id.content)
    }
}