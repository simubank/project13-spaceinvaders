import Foundation
import IGListKit

public class StockPurchaseController: ListSectionController {
    public var trade: InvestingSimulationTransaction?
    
    public override func didUpdate(to object: Any) {
        trade = object as? InvestingSimulationTransaction
    }
    
    public override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: StockPurchaseCell.self, for: self, at: index) as? StockPurchaseCell else {
            fatalError()
        }
        if let trade = trade {
            cell.symbolLabel.text = "\(trade.stockSymbol) - [\(trade.expenseName ?? "Expense Description N/A")]"
            cell.actionLabel.text = "BUY \(trade.amount) @ \(trade.price)"
            cell.dateLabel.text = trade.date
        }
        return cell
    }
    
    public override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: 60)
    }
}
