package ca.td.td4m3.mortgage.activity

import android.os.Bundle
import android.support.v4.app.FragmentActivity
import android.support.v7.widget.RecyclerView
import android.widget.Spinner
import ca.td.td4m3.R
import com.thejuki.kformmaster.helper.FormBuildHelper
import com.thejuki.kformmaster.model.*
import android.widget.ArrayAdapter
import ca.td.td4m3.Constants.Companion.FREQUENCY_BI_WEEKLY
import ca.td.td4m3.Constants.Companion.FREQUENCY_MONTHLY
import ca.td.td4m3.Constants.Companion.FREQUENCY_WEEKLY


class MortgageCalculatorActivity : FragmentActivity() {

    private lateinit var formBuilder: FormBuildHelper
    private lateinit var recyclerView: RecyclerView
    private lateinit var spinner: Spinner

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_mortgage_calculator)

        recyclerView = findViewById(R.id.recyclerView_calculator_mortgage)
        spinner = findViewById(R.id.frequency_spinner)

        formBuilder = FormBuildHelper(this)
        formBuilder.attachRecyclerView(this, recyclerView)

        val elements: MutableList<BaseFormElement<*>> = mutableListOf()

        val principleAmountEditText = FormNumberEditTextElement()
        configureElement(principleAmountEditText, getString(R.string.mortgage_principal_amount),
                getString(R.string.mortgage_base_principle_hint),
                getString(R.string.mortgage_base_disclaimer))

        val interestRateEditText = FormNumberEditTextElement()
        configureElement(interestRateEditText, getString(R.string.mortgage_interest_rate_title),
                getString(R.string.mortgage_interest_hint),
                null)

        val amortizationEditText = FormNumberEditTextElement()
        configureElement(amortizationEditText, getString(R.string.mortgage_amortization_title),
                getString(R.string.mortgage_amortization_hint),
                getString(R.string.mortgage_amortization_disclaimer))

        val frequencyLabel = FormLabelElement()
        configureElement(frequencyLabel, getString(R.string.mortgage_payment_frequency),
                null,
                null)

        elements.add(principleAmountEditText)
        elements.add(interestRateEditText)
        elements.add(amortizationEditText)
        elements.add(frequencyLabel)

        formBuilder.addFormElements(elements)

        setUpSpinner()
    }

    private fun configureElement(form: BaseFormElement<String>,
                                 title: String,
                                 hint: String?,
                                 error: String?) {
        form.setRightToLeft(false)

        if (form is FormNumberEditTextElement) {
            form.setNumbersOnly(true)
        }

        form.setTitle(title)
        form.setHint(hint)
        form.setError(error)
    }

    private fun setUpSpinner() {
        val recurrences = ArrayList<String>()
        recurrences.add(FREQUENCY_MONTHLY)
        recurrences.add(FREQUENCY_WEEKLY)
        recurrences.add(FREQUENCY_BI_WEEKLY)

        val adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, recurrences)
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        // Apply the adapter to the spinner
        spinner.adapter = adapter
    }
}