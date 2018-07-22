import Foundation

public class YahooSearchSymbolRs: Codable {
    public let payload: YahooSearchSymbolPayload
    
    enum CodingKeys: String, CodingKey {
        case payload = "ResultSet"
    }
    
    @available(*, deprecated, message: "Do not use.")
    init() {
        fatalError("Swift 4.1")
    }
}

public class YahooSearchSymbolPayload: Codable {
    public let query: String
    public let result: [YahooStock]
    enum CodingKeys: String, CodingKey {
        case query = "Query"
        case result = "Result"
    }
    @available(*, deprecated, message: "Do not use.")
    init() {
        fatalError("Swift 4.1")
    }
}

public class YahooStock: Codable {
    public let symbol: String
    public let name: String
    public let exch: String
    public let type: String
    public let exchDisp: String
    public let typeDisp: String
    @available(*, deprecated, message: "Do not use.")
    init() {
        fatalError("Swift 4.1")
    }
}
