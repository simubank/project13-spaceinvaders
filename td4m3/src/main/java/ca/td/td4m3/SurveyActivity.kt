package ca.td.td4m3

import android.app.Activity
import android.os.Bundle

class SurveyActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTitle(R.string.survey_header_title)
        setContentView(R.layout.activity_survey)
    }
}