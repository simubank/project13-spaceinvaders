import Foundation
import IGListKit

public enum TDCreditCard: String{
    case cashBackInfinite = "TD Cash Back Visa Infinite Card"
    case cashBackVisa = "TD Cash Back Visa* Card"
    case aeroplanVisa = "TD Aeroplan Visa Infinite Card"
    case aeroplanVisaPlatinum = "TD Aeroplan Visa Platinum Card"
    case aeroplanVisaInfinitePrivilege = "TD Aeroplan Visa Infinite Privilege Card"
    case firstClassTravel = "TD First Class Travel Visa Infinite Card"
    case platinumTravel = "TD Platinum Travel Visa Card"
    case rewardsVisa = "TD Rewards Visa Card"
    case flexRateVisa = "TD Emerald Flex Rate Visa Card"
    case usDollarCard = "TD U.S. Dollar Visa Card"
    
    var url: String {
        switch self {
        case .cashBackInfinite:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/cash-back/cash-back-visa-infinite-card/"
        case .cashBackVisa:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/cash-back/cash-back-visa-card/"
        case .aeroplanVisa:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/aeroplan/aeroplan-visa-infinite-card/"
        case .aeroplanVisaPlatinum:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/aeroplan/aeroplan-visa-platinum-card/"
        case .aeroplanVisaInfinitePrivilege:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/aeroplan/aeroplan-visa-infinite-privilege-card/"
        case .firstClassTravel:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/travel-rewards/first-class-travel-visa-infinite-card/"
        case .platinumTravel:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/travel-rewards/platinum-travel-visa-card/"
        case .rewardsVisa:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/travel-rewards/rewards-visa-card/"
        case .flexRateVisa:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/low-rate/emerald-flex-rate-visa-card/"
        case .usDollarCard:
            return "https://www.td.com/ca/en/personal-banking/products/credit-cards/us-dollar/us-dollar-visa-card/"
        }
    }
}
