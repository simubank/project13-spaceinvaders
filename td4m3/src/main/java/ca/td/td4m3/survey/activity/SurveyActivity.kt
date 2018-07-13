package ca.td.td4m3.survey.activity

import ca.td.td4m3.R
import ca.td.td4m3.survey.adapter.SurveyAdapter
import ca.td.td4m3.survey.presenter.SurveyPresenter
import com.ngam.rvabstractions.AbstractActivity
import com.ngam.rvabstractions.AbstractClassProperties

class SurveyActivity : AbstractActivity<SurveyPresenter, SurveyAdapter>() {
    override fun setProperties(): AbstractClassProperties<SurveyPresenter, SurveyAdapter> {
        presenter = SurveyPresenter()
        adapter = SurveyAdapter()
        val title: String = getString(R.string.survey_header_title)
        return AbstractClassProperties(presenter, adapter, title)
    }
}