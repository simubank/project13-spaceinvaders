import Foundation
import IGListKit

public class InvestingSimulationTransaction: NSObject {
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
