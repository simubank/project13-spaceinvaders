import Foundation

enum PersonalAccountType: String {
    case AllInclusiveBanking = "All Inclusive Banking"
    case UnlimitedChequing = "Unlimited Chequing"
    case EveryDayChequing = "Every Day Chequing"
    case MinimumChequing  = "Minimum Chequing"
    case StudentChequing = "Student Chequing"
    case YouthAccount = "Youth"
}

class PersonalAccount {
    var accountName: PersonalAccountType
    var monthlyFee: Float
    var transactionsPerMonth: Float
    var planHighlights: [String: String]
    var moreInfoURL: URL
    
    init(accountName: PersonalAccountType, monthlyFee: Float, transactionsPerMonth: Float, planHighlights: [String: String], moreInfoURL: URL) {
        self.accountName = accountName
        self.monthlyFee = monthlyFee
        self.transactionsPerMonth = transactionsPerMonth
        self.planHighlights = planHighlights
        self.moreInfoURL = moreInfoURL
    }
}
