import Moya
import Foundation

public let AlphaVantageService = MoyaProvider<AlphaVantage>(plugins: [NetworkLoggerPlugin()])

public enum AlphaVantage {
    case historicalPrices(symbol: String)
}

extension AlphaVantage: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://www.alphavantage.co")!
    }
    
    public var path: String {
        switch self {
        case .historicalPrices:
            return "/query"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .historicalPrices:
            return .get
        }
    }
    
    public var sampleData: Data {
        return "".utf8Encoded
    }
    
    public var task: Task {
        switch self {
        case let .historicalPrices(symbol):
            var params: [String : AnyObject] = [:]
            params["symbol"] = symbol as AnyObject
            params["function"] = "TIME_SERIES_DAILY" as AnyObject
            params["apikey"] = "TS988KUY986K34W5" as AnyObject
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json",
                "Authorization" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDQlAiLCJ0ZWFtX2lkIjoiMjgxMzgzOCIsImV4cCI6OTIyMzM3MjAzNjg1NDc3NSwiYXBwX2lkIjoiMWY5ZTA4OTAtNzdiNS00NGFlLWE5ODctMDNhMGE2YTEwMjlhIn0.FEdf6MQ1XLVFaaV3V6Ocf3aAcGXksANva2K_YTUz2EA"]
    }
}
