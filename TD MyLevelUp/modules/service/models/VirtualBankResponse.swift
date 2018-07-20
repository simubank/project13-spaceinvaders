import Foundation

public class VirtualBankResponse<T: Codable>: Codable {
    public let result: T?
    public let errorMsg: String?
    public let errorDetails: String?
    public let statusCode: Int
    
    @available(*, deprecated, message: "Do not use.")
    init() {
        fatalError("Swift 4.1")
    }
}
