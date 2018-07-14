package ca.td.tdmylevelup

import android.app.Activity
import android.os.Bundle
import ca.td.td4m3.dashboard.DashboardActivity
import ca.td.td4m3.extensions.launchActivity

class StartUpActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_startup)
        launchActivity<DashboardActivity> { }
        finish()
    }
}
