import Foundation

enum PersonalAccountType {
    case AllInclusiveBanking
    case UnlimitedChequing
    case EveryDayChequing
    case MinimumChequing
    case StudentChequing
    case YouthAccount
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
