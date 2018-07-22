import Moya
import Foundation

public let VirtualBankService = MoyaProvider<VirtualBank>(stubClosure: { _ in
    return AccountManager.shared.id == "" ? .delayed(seconds: 0.2) : .never
})

public enum VirtualBank {
    case customer(id: String)
    case accounts
    case transactionsFor(customerId: String)
}

extension VirtualBank: TargetType {

    public var baseURL: URL {
        return URL(string: "https://dev.botsfinancial.com")!
    }
    
    public var path: String {
        switch self {
        case .accounts:
           return "/api/accounts/self"
        case let .transactionsFor(id):
           return "/api/accounts/\(id)/transactions"
        case let .customer(id):
            return "/api/customers/\(id)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .accounts, .transactionsFor, .customer:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .accounts:
            return .json(named: "getAccountsSelf")
        case let .transactionsFor(id):
            return .json(named: "getCustomer")
        case let .customer(id):
            return .json(named: "getCustomer")
        }
    }
    
    public var task: Task {
        switch self {
        case .accounts, .transactionsFor, .customer:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json",
                "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDQlAiLCJ0ZWFtX2lkIjoiMjgxMzgzOCIsImV4cCI6OTIyMzM3MjAzNjg1NDc3NSwiYXBwX2lkIjoiMWY5ZTA4OTAtNzdiNS00NGFlLWE5ODctMDNhMGE2YTEwMjlhIn0.FEdf6MQ1XLVFaaV3V6Ocf3aAcGXksANva2K_YTUz2EA"]
    }
}

