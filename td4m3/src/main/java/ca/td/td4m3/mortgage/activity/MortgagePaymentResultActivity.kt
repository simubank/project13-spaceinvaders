package ca.td.td4m3.mortgage.activity

import android.os.Bundle
import android.support.v4.app.FragmentActivity
import android.widget.TextView
import ca.td.td4m3.Constants.Companion.AUTH_TOKEN
import ca.td.td4m3.Constants.Companion.ID
import ca.td.td4m3.R
import com.android.volley.VolleyError
import com.td.virtualbank.*
import java.math.BigDecimal
import java.util.ArrayList

class MortgagePaymentResultActivity : FragmentActivity() {

    private lateinit var monthlyPayments: String
    private lateinit var principal: String
    private lateinit var interest: String
    private lateinit var period: String
    private var sum: BigDecimal = BigDecimal.ZERO
    private var isCustomerEligible = false

    private val vb = VirtualBank.getBank(AUTH_TOKEN)

    private lateinit var monthlyPaymentsTextView: TextView
    private lateinit var eligibilityTextView: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_mortgage_payment_result)

        monthlyPayments = intent.getStringExtra("monthly_payments")
        principal = intent.getStringExtra("principal")
        interest = intent.getStringExtra("rate")
        period = intent.getStringExtra("period")

        monthlyPaymentsTextView = findViewById(R.id.monthly_payments)
        monthlyPaymentsTextView.apply {
            this.text = getString(R.string.mortgage_payment_result, monthlyPayments)
        }

        eligibilityTextView = findViewById(R.id.eligibility_text_view)
        eligibilityTextView.apply {
            if (!isCustomerEligible) {
                this.text = getString(R.string.mortgage_eligible)
                this.background = getDrawable(R.color.eligible_bg)
            } else {
                this.text = getString(R.string.mortgage_not_eligible)
                this.background = getDrawable(R.color.error_bg)
            }
        }

        vb.getCustomerTransactions(this, ID,
                object : VirtualBankGetCustomerTransactionsRequest() {
            override fun onSuccess(p0: ArrayList<VirtualBankTransaction>?) {
                p0!!.forEach {
                    sum.add(BigDecimal(it.currencyAmount))
                }
                val average = sum.divide(BigDecimal(p0.size))

                if (average >= BigDecimal(monthlyPayments)) {
                    isCustomerEligible = true
                }
            }

            override fun onError(p0: VolleyError?) {
            }
        })
    }
}