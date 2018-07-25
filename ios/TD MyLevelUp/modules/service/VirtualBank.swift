import Moya
import Foundation

public let VirtualBankService = MoyaProvider<VirtualBank>(stubClosure: { _ in
    return AccountManager.shared.id == "" ? .delayed(seconds: 0.2) : .never
})

public enum VirtualBank {
    case customer(id: String)
    case account
    case accounts(user: String)
    case transactionsFor(account: String)
}

extension VirtualBank: TargetType {

    public var baseURL: URL {
        return URL(string: "https://dev.botsfinancial.com")!
    }
    
    public var path: String {
        switch self {
        case .account:
           return "/api/accounts/self"
        case .accounts(let user):
           return "/api/customers/\(user)/accounts"
        case let .transactionsFor(id):
           return "/api/accounts/\(id)/transactions"
        case let .customer(id):
            return "/api/customers/\(id)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .account, .transactionsFor, .customer, .accounts:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .account:
            return .json(named: "getAccountsSelf")
        case .accounts(_):
            return .json(named: "getAccounts")
        case .transactionsFor(_):
            return .json(named: "getTransactions")
        case .customer(_):
            return .json(named: "getCustomer")
        }
    }
    
    public var task: Task {
        switch self {
        case .account, .transactionsFor, .customer, .accounts:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json",
                "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDQlAiLCJ0ZWFtX2lkIjoiMjgxMzgzOCIsImV4cCI6OTIyMzM3MjAzNjg1NDc3NSwiYXBwX2lkIjoiMWY5ZTA4OTAtNzdiNS00NGFlLWE5ODctMDNhMGE2YTEwMjlhIn0.FEdf6MQ1XLVFaaV3V6Ocf3aAcGXksANva2K_YTUz2EA"]
    }
}

