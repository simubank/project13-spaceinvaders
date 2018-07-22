package ca.td.td4m3

class Constants private constructor() {

    companion object {
        const val AUTH_TOKEN : String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDQlAiLCJ0ZWFtX2lkIjoiMjgxMzgzOCIsImV4cCI6OTIyMzM3MjAzNjg1NDc3NSwiYXBwX2lkIjoiMWY5ZTA4OTAtNzdiNS00NGFlLWE5ODctMDNhMGE2YTEwMjlhIn0.FEdf6MQ1XLVFaaV3V6Ocf3aAcGXksANva2K_YTUz2EA"
        const val ID = "1f9e0890-77b5-44ae-a987-03a0a6a1029a_6c8434d3-9d00-45d9-83d6-5c87cc97cdd8"
        const val FREQUENCY_MONTHLY = "Monthly"
        const val FREQUENCY_WEEKLY = "Weekly"
        const val FREQUENCY_BI_WEEKLY = "Bi-Weekly"
        const val WEEKS_IN_YEAR = 52
        const val MONTHS_IN_YEAR = 12
        const val MIN_AMORTIZATION_PERIOD = 1
        const val MAX_AMORTIZATION_PERIOD = 30
        const val MIN_MORTGAGE_AMOUNT = 20000.00
        const val MAX_MORTGAGE_AMOUNT = 9000000.00
    }
}