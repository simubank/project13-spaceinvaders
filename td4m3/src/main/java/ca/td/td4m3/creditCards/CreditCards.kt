package ca.td.td4m3.creditCards

import android.content.Context
import android.net.Uri
import android.support.customtabs.CustomTabsIntent
import android.view.View
import ca.td.td4m3.R
import ca.td.td4m3.components.crditCardRowItem.CreditCardRowItemDataSource
import ca.td.td4m3.components.stackedView.StackedViewDataSource

// Since I'm too lazy to do it properly, I am just going to stub all credit cards here.
class CreditCards private constructor() {
    companion object {
        fun getTDCashBackVisaInfiniteCard(context: Context): CreditCardRowItemDataSource {
            val firstSubView = StackedViewDataSource("Cash Back", "1-3%")
            val secondSubView = StackedViewDataSource("Annual Fee", "$120")
            val thirdSubView = StackedViewDataSource("Interest Rate", "20.99%")
            val fourthSubView = StackedViewDataSource("Click here to", "Learn More!", View.OnClickListener {
                val url = "https://www.td.com/ca/en/personal-banking/products/credit-cards/cash-back/cash-back-visa-infinite-card/"
                CustomTabsIntent.Builder().build().launchUrl(context, Uri.parse(url))
            })
            return CreditCardRowItemDataSource(R.drawable.cash_back_infinite_visa_card_small,
                    "TD Cash Back Visa Infinite Card",
                    "Earn 3% in Cash Back Dollars on eligible grocery " +
                            "Purchases and gas Purchases, and on regularly recurring bill payments set " +
                            "up on your Account. Earn 1% in Cash Back Dollars on all other Purchases made " +
                            "with your Card. Limit of $5000",
                    firstSubView, secondSubView, thirdSubView, fourthSubView)
        }

        fun getTDCashBackVisaCard(context: Context): CreditCardRowItemDataSource {
            val firstSubView = StackedViewDataSource("Cash Back", "0.5-1%")
            val secondSubView = StackedViewDataSource("Annual Fee", "$0!")
            val thirdSubView = StackedViewDataSource("Interest Rate", "19.99%")
            val fourthSubView = StackedViewDataSource("Click here to", "Learn More!",
                    View.OnClickListener {
                        val url = "https://www.td.com/ca/en/personal-banking/products/credit-cards/cash-back/cash-back-visa-card/"
                        CustomTabsIntent.Builder().build().launchUrl(context, Uri.parse(url))
            })
            return CreditCardRowItemDataSource(R.drawable.cash_back_visa_card_small,
                    "TD Cash Back Visa Card",
                    "Earn 1% in Cash Back Dollars on eligible grocery Purchases and " +
                            "gas Purchases and on regularly recurring bill payments set up on your Account. " +
                            "Earn 0.5% in Cash Back Dollars on all other Purchases made with your Card. " +
                            "Minimum limit of $500", firstSubView, secondSubView, thirdSubView, fourthSubView)
        }

        fun getTDFreeRewardsCard(context: Context): CreditCardRowItemDataSource {
            val firstSubView = StackedViewDataSource("Annual Fee", "$0!")
            val secondSubView = StackedViewDataSource("Interest Rate", "19.99%")
            val thirdSubView = StackedViewDataSource("Cash Interest", "22.99%")
            val fourthSubView = StackedViewDataSource("Click here to", "Learn More!",
                    View.OnClickListener {
                        val url = "https://www.td.com/ca/en/personal-banking/products/credit-cards/travel-rewards/rewards-visa-card/"
                        CustomTabsIntent.Builder().build().launchUrl(context, Uri.parse(url))
                    })
            return CreditCardRowItemDataSource(R.drawable.td_free_rewards_card,
                    "TD Rewards Visa Card",
                    "Earn 2 TD Rewards Points for every $1 in grocery, restaurant and " +
                            "fast food purchases, and regularly recurring bill payments. " +
                            "Earn 1 TD Rewards Point for every $1 you spend on all other purchase. $500 Minimum limit",
                    firstSubView, secondSubView, thirdSubView, fourthSubView)
        }

        fun getTDPlatinumTravelVisa(context: Context): CreditCardRowItemDataSource {
            val firstSubView = StackedViewDataSource("Annual Fee", "$89")
            val secondSubView = StackedViewDataSource("Interest Rate", "19.99%")
            val thirdSubView = StackedViewDataSource("Cash Interest", "22.99%")
            val fourthSubView = StackedViewDataSource("Click here to", "Learn More!",
                    View.OnClickListener {
                        val url = "https://www.td.com/ca/en/personal-banking/products/credit-cards/travel-rewards/platinum-travel-visa-card/"
                        CustomTabsIntent.Builder().build().launchUrl(context, Uri.parse(url))
                    })
            return CreditCardRowItemDataSource(R.drawable.platinum_travel_visa_card_small,
                    "TD Platinum Travel Visa Card",
                    "Apply online by August 27, 2018 to get a full Annual Fee Rebate1 " +
                            "for the Primary Cardholder for the first year plus up to 20,000 TD Rewards Points!",
                    firstSubView, secondSubView, thirdSubView, fourthSubView)
        }
    }
}