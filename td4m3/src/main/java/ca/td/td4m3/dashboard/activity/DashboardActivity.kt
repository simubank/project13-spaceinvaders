package ca.td.td4m3.dashboard.activity

import android.content.Intent
import android.os.Bundle
import ca.td.td4m3.Constants
import ca.td.td4m3.dashboard.adapter.DashboardAdapter
import ca.td.td4m3.dashboard.presenter.DashboardPresenter
import ca.td.td4m3.R
import ca.td.td4m3.survey.activity.SurveyActivity
import ca.td.td4m3.dashboard.view.DashboardView
import com.ngam.rvabstractions.AbstractActivity
import com.ngam.rvabstractions.AbstractClassProperties

class DashboardActivity : AbstractActivity<DashboardPresenter, DashboardAdapter>(), DashboardView {
    override fun setProperties(): AbstractClassProperties<DashboardPresenter, DashboardAdapter> {
        presenter = DashboardPresenter()
        adapter = DashboardAdapter()
        val dashboardTitle: String = getString(R.string.dashboard_title)
        return AbstractClassProperties(presenter, adapter, dashboardTitle)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

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
