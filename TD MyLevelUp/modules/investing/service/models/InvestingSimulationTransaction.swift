import Foundation
import IGListKit

public class InvestingSimulationTransaction {
    public let stockSymbol: String
    public let expenseName: String?
    public let amount: Double
    public let price: Double
    public let date: String
    
    public init(stockSymbol: String, expenseName: String?, amount: Double, price: Double, date: String) {
        self.stockSymbol = stockSymbol
        self.expenseName = expenseName
        self.amount = amount
        self.price = price
        self.date = date
    }
}

extension InvestingSimulationTransaction: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return "\(stockSymbol)\(amount)\(price)" as NSObjectProtocol
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? InvestingSimulationTransaction else { return false }
        return object.stockSymbol == stockSymbol && object.amount == amount && object.price == price
    }
}
