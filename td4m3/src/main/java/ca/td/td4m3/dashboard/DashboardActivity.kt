package ca.td.td4m3.dashboard

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import ca.td.td4m3.Constants
import ca.td.td4m3.R
import ca.td.td4m3.survey.activity.SurveyActivity

class DashboardActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.dashboard_layout)

        val isFirstTimeOpened = getSharedPreferences(Constants.SHARED_PREFERENCES, MODE_PRIVATE)
                .getBoolean(Constants.IS_FIRST_TIME, true)

        if (isFirstTimeOpened) {
            val intent = Intent(this, SurveyActivity::class.java)
            startActivity(intent)
        }

        getSharedPreferences(Constants.SHARED_PREFERENCES, MODE_PRIVATE).edit()
                .putBoolean(Constants.IS_FIRST_TIME, false).apply()
    }
}
