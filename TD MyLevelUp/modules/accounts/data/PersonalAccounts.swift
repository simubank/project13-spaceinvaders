import Foundation

class PersonalAccounts {
    
    // MARK:- Plan highlights
    static let allInclusiveHighlights = [
        "Unlimited transactions": "You can take money out of your account however many times you like with no transacation fees",
        "No TD ATM fees": "For TD and non-TD ATMs",
        "Free e-transfer": "Pay your friends back or chip in for pizza using Interac e-transfer",
        "Premium perks": "Free small safety deposit box, certified cheques, money orders, and personalizes cheques. All free of charge"
    ]
    
    static let unlimitedHighlights = [
        "Unlimited transactions": "You can take money out of your account however many times you like with no transacation fees",
        "No TD ATM fees": "For TD and non-TD ATMs",
        "Free e-transfer": "Pay your friends back or chip in for pizza using Interac e-transfer",
        "Credit card fee rebate": "$20 off the Annual fee for the first year of your choice for one of five select TD Credit Cards"
    ]
    
    static let everyDayHighlights = [
        "Included transactions": "No transaction fees on your first 25 transactions in a month, additional transactions are $1.25 each",
        "Additional account benefits": "Enjoy EasyWeb View Cheque service, and paperless record keeping or online statements",
        "Free e-transfer": "Pay your friends back or chip in for pizza using Interac e-transfer",
        "Monthly fee rebate": "No monthly fee if you have $3000 or more in your account at the end of each day in the month"
    ]
    
    static let minimumCheqHighlights = [
        "Included transactions": "No transaction fees on your first 12 transactions in a month. (Additional transactions are $1.25 each)",
        "Additional account benefits": "Enjoy EasyWeb View Cheque service, and paperless record keeping or online statements",
        "EasyWeb Online banking": "Bank online from the comfort and convenience of your home",
        "Mobile Banking": "Download the TD app to view your balances, transactions, make bill payments, locate a TD branch and more"
    ]
    
    static let studentCheqHighlights = [
        "Perfect for the full-time post-secondary student": "No monthly fees with this account for full-time post-secondary students",
        "Included transactions": "No transaction fees on your first 12 transactions in a month. (Additional transactions are $1.25 each)",
        "Free e-transfer": "Pay your friends back or chip in for pizza using Interac e-transfer",
        "Additional account benefits": "Enjoy EasyWeb View Cheque service, and paperless record keeping or online statements"
    ]
    
    static let youthPlanHighlights = [
        "Best of Chequing and Savings account": "Enjoy the convenience of unlimited transactions with the perk of earning interest on your balance",
        "Interest on every dollar": "Help them start saving early with interest on every dollar, calculated daily",
        "Unlimited transactions": "You can take money out of your account however many times you like with no transacation fees"
    ]
    
    
    // MARK:- Banking accounts
    let allInclusiveBanking = PersonalAccount(accountName: .AllInclusiveBanking, monthlyFee: 29.95, transactionsPerMonth: .infinity, planHighlights: allInclusiveHighlights, moreInfoURL: URL(string: "https://www.td.com/ca/en/personal-banking/products/bank-accounts/chequing-accounts/all-inclusive-banking-plan/")!)
    
    let unlimitedChequing = PersonalAccount(accountName: .UnlimitedChequing, monthlyFee: 15.95, transactionsPerMonth: .infinity, planHighlights: unlimitedHighlights, moreInfoURL: URL(string: "https://www.td.com/ca/en/personal-banking/products/bank-accounts/chequing-accounts/unlimited-chequing-account/")!)
    
    let everyDayChequing = PersonalAccount(accountName: .EveryDayChequing, monthlyFee: 10.95, transactionsPerMonth: 25, planHighlights: everyDayHighlights, moreInfoURL: URL(string: "https://www.td.com/ca/en/personal-banking/products/bank-accounts/savings-accounts/every-day-savings-account/")!)
    
    let minimumChequing = PersonalAccount(accountName: .MinimumChequing, monthlyFee: 3.95, transactionsPerMonth: 12, planHighlights: minimumCheqHighlights, moreInfoURL: URL(string: "https://www.td.com/ca/en/personal-banking/products/bank-accounts/chequing-accounts/minimum-chequing-account/")!)
    
    let studentChequing = PersonalAccount(accountName: .StudentChequing, monthlyFee: 0.00, transactionsPerMonth: 25, planHighlights: studentCheqHighlights, moreInfoURL: URL(string: "https://www.td.com/ca/en/personal-banking/products/bank-accounts/chequing-accounts/student-chequing-account/")!)
    
    let youthChequing = PersonalAccount(accountName: .YouthAccount, monthlyFee: 0.00, transactionsPerMonth: .infinity, planHighlights: youthPlanHighlights, moreInfoURL: URL(string: "https://www.td.com/ca/en/personal-banking/products/bank-accounts/savings-accounts/youth-account/")!)
    
}
