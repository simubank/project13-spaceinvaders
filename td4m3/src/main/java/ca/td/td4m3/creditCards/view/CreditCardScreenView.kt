package ca.td.td4m3.creditCards.view

import com.td.virtualbank.VirtualBankAccount

interface CreditCardScreenView {
    fun reloadView()

    fun requestAccounts()

    fun requestTransactionsForAccount(account: VirtualBankAccount)
}