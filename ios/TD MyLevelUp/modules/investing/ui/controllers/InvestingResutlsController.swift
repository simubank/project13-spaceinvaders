import Foundation
import IGListKit

public class InvestingResultSummary: NSObject {
    public let totalExpenses: Double
    public let totalShares: Double
    public let sharePrice: Double
    public let totalInvestment: Double
    
    public init(totalExpenses: Double, totalShares: Double,
                sharePrice: Double, totalInvestment: Double) {
        self.totalExpenses = totalExpenses.round()
        self.totalShares = totalShares.round()
        self.sharePrice = sharePrice.round()
        self.totalInvestment = totalInvestment.round()
        super.init()
    }
}

public class InvestingResutlsController: ListSectionController {
    public var model: InvestingResultSummary?
    
    public override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: InvestingResultsCell.self,
                                                                for: self, at: index) as? InvestingResultsCell, let model = model else {
            fatalError()
        }
        cell.totalExpensesValue.countFrom(0, to: CGFloat(model.totalExpenses), withDuration: 0.6)
        cell.potentialEarningsValue.countFrom(0, to: CGFloat(model.totalInvestment), withDuration: 0.6)
        cell.growthValue.countFrom(0, to: CGFloat(model.totalInvestment - model.totalExpenses), withDuration: 0.6)
        return cell
    }
    
    public override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: 120)
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? InvestingResultSummary
    }
}
