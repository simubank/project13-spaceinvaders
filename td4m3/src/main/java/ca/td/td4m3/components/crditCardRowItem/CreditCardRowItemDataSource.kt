package ca.td.td4m3.components.crditCardRowItem

import android.support.annotation.DrawableRes
import ca.td.td4m3.components.stackedView.StackedViewDataSource

data class CreditCardRowItemDataSource(
        @DrawableRes val cardImageRes: Int,
        val cardName: String,
        val cardDescription: String,
        val firstInformationDataSource: StackedViewDataSource? = null,
        val secondInformationDataSource: StackedViewDataSource? = null,
        val thirdInformationDataSource: StackedViewDataSource? = null,
        val fourthInformationDataSource: StackedViewDataSource? = null)