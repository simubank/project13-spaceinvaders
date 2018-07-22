import Foundation
import Moya

public let YahooService = MoyaProvider<YahooAPI>()

public enum YahooAPI {
    case search(symbol: String)
}

extension YahooAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "http://d.yimg.com/autoc.finance.yahoo.com")!
    }
    
    public var path: String {
        switch self {
        case .search(_):
            return "/autoc"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .search(_):
            return .get
        }
    }
    
    public var sampleData: Data {
        return "".utf8Encoded
    }
    
    public var task: Task {
        switch self {
        case let .search(query):
            var params: [String : AnyObject] = [:]
            params["query"] = query as AnyObject
            params["region"] = "1" as AnyObject
            params["lang"] = "en" as AnyObject
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
