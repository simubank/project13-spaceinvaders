package ca.td.td4m3

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle

class DashboardActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_dashboard)

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
