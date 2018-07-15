package ca.td.td4m3.dashboard.creditCard.presenter

import android.content.Intent
import android.view.View
import ca.td.td4m3.activities.MortgageActivity
import com.ngam.rvabstractions.AbstractPresenter

class MortgagePresenter: AbstractPresenter() {

    fun getBinderListener(): View.OnClickListener {
        return View.OnClickListener {
            val context = it.context
            val intent = Intent(context, MortgageActivity::class.java)
            context.startActivity(intent)
        }
    }
}