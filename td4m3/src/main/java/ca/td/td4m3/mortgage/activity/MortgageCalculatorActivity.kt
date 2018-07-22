package ca.td.td4m3.mortgage.activity

import android.content.Intent
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.support.v4.app.FragmentActivity
import android.support.v7.widget.RecyclerView
import android.widget.Spinner
import ca.td.td4m3.R
import com.thejuki.kformmaster.helper.FormBuildHelper
import com.thejuki.kformmaster.model.*
import android.widget.ArrayAdapter
import android.widget.Button
import ca.td.td4m3.Constants.Companion.FREQUENCY_BI_WEEKLY
import ca.td.td4m3.Constants.Companion.FREQUENCY_MONTHLY
import ca.td.td4m3.Constants.Companion.FREQUENCY_WEEKLY
import ca.td.td4m3.Constants.Companion.MAX_AMORTIZATION_PERIOD
import ca.td.td4m3.Constants.Companion.MAX_MORTGAGE_AMOUNT
import ca.td.td4m3.Constants.Companion.MIN_AMORTIZATION_PERIOD
import ca.td.td4m3.Constants.Companion.MIN_MORTGAGE_AMOUNT
import ca.td.td4m3.mortgage.CalculatorUtils
import java.math.BigDecimal

class MortgageCalculatorActivity : FragmentActivity() {

    private lateinit var formBuilder: FormBuildHelper
    private lateinit var recyclerView: RecyclerView
    private lateinit var spinner: Spinner
    private lateinit var button: Button
    private lateinit var principalAmountEditText: FormNumberEditTextElement
    private lateinit var interestRateEditText: FormNumberEditTextElement
    private lateinit var amortizationEditText: FormNumberEditTextElement

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_mortgage_calculator)

        recyclerView = findViewById(R.id.recyclerView_calculator_mortgage)
        spinner = findViewById(R.id.frequency_spinner)
        button = findViewById(R.id.calculate_payment_button)

        formBuilder = FormBuildHelper(this)
        formBuilder.attachRecyclerView(this, recyclerView)

        val elements: MutableList<BaseFormElement<*>> = mutableListOf()

        principalAmountEditText = FormNumberEditTextElement()
        configureElement(principalAmountEditText, getString(R.string.mortgage_principal_amount),
                getString(R.string.mortgage_base_principle_hint),
                false)
        principalAmountEditText.valueObservers.add { _, element ->
            configureValidationMessage(element, isPrincipalFieldValid(), getString(R.string.mortgage_base_disclaimer))
        }

        interestRateEditText = FormNumberEditTextElement()
        configureElement(interestRateEditText, getString(R.string.mortgage_interest_rate_title),
                getString(R.string.mortgage_interest_hint),
                false
        )
        interestRateEditText.valueObservers.add { _, element ->
            configureValidationMessage(element, isInterestFieldValid(), getString(R.string.mortgage_maximum_interest_title))
        }

        amortizationEditText = FormNumberEditTextElement()
        configureElement(amortizationEditText, getString(R.string.mortgage_amortization_title),
                getString(R.string.mortgage_amortization_hint),
                true)
        amortizationEditText.valueObservers.add { _, element ->
            configureValidationMessage(element, isAmortizationFieldValid(), getString(R.string.mortgage_amortization_disclaimer))
        }

        val frequencyLabel = FormLabelElement()
        configureElement(frequencyLabel, getString(R.string.mortgage_payment_frequency),
                null,
                false)

        elements.add(principalAmountEditText)
        elements.add(interestRateEditText)
        elements.add(amortizationEditText)
        elements.add(frequencyLabel)

        formBuilder.addFormElements(elements)

        setUpSpinner()

        button.setOnClickListener { _ ->

            if (isValidForm()) {
                val principal: String = principalAmountEditText.value!!
                val interestRate: String = interestRateEditText.value!!
                val amortization: String = amortizationEditText.value!!

                val monthlyPayments = CalculatorUtils.calculatePayment(principal,
                        interestRate,
                        amortization.toInt(),
                        spinner.selectedItem.toString())

                // Start Result Activity
                val intent = Intent(this@MortgageCalculatorActivity,
                        MortgagePaymentResultActivity::class.java)
                intent.putExtra("principal", principal)
                intent.putExtra("rate", interestRate)
                intent.putExtra("period", amortization)
                intent.putExtra("monthly_payments", monthlyPayments.toString())

                startActivity(intent)
            }
        }
    }

    private fun configureElement(form: BaseFormElement<String>,
                                 title: String,
                                 hint: String?,
                                 isNumberOnly: Boolean) {
        form.setRightToLeft(false)

        if (form is FormNumberEditTextElement) {
            form.setNumbersOnly(isNumberOnly)
        }

        form.updateOnFocusChange = false
        form.setTitle(title)
        form.setHint(hint)
        form.valueObservers.add { _, element ->
            if (isValidForm()) {
                setFormState(true, getDrawable(R.color.td_green))
            } else {
                setFormState(false, getDrawable(R.color.grey))
            }
        }
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

    private fun isPrincipalFieldValid(): Boolean {
        return try {
            val value = BigDecimal(principalAmountEditText.value)

            principalAmountEditText.isValid &&
                    value >= BigDecimal(MIN_MORTGAGE_AMOUNT) &&
                    value <= BigDecimal(MAX_MORTGAGE_AMOUNT)
        } catch (e: Exception) {
            false
        }
    }

    private fun isInterestFieldValid(): Boolean {
        return try {
            val value = BigDecimal(interestRateEditText.value)

            return interestRateEditText.isValid &&
                    value > BigDecimal.ZERO &&
                    value <= BigDecimal.TEN
        } catch (e: Exception) {
            false
        }
    }

    private fun isAmortizationFieldValid(): Boolean {
        return try {
            val value = BigDecimal(amortizationEditText.value)

            return amortizationEditText.isValid &&
                    value >= BigDecimal(MIN_AMORTIZATION_PERIOD) &&
                    value <= BigDecimal(MAX_AMORTIZATION_PERIOD)
        } catch (e: Exception) {
            false
        }
    }

    private fun isValidForm(): Boolean {
        return isPrincipalFieldValid() &&
                isInterestFieldValid() &&
                isAmortizationFieldValid()
    }

    private fun setFormState(enabledButton: Boolean, bg: Drawable) {
        button.isEnabled = enabledButton
        button.background = bg
    }

    private fun configureValidationMessage(element: BaseFormElement<String>, isValid: Boolean, msg: String) {
        if (isValid) {
            element.error = null
        } else {
            element.error = msg
        }
    }
}