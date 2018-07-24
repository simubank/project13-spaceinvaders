import Foundation

import Foundation
import IGListKit
import SafariServices
import Charts

public class CreditHealthModel: NSObject {
    public let transactions: [Transaction]
    
    public init(transactions: [Transaction]) {
        self.transactions = transactions
    }
}

public class CreditHealthController: ListSectionController {
    open var model: CreditHealthModel?
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: index == 0 ? 60 : 120)
    }
    
    public override func numberOfItems() -> Int {
        return 2
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        if index == 0 {
            guard let cell = collectionContext?.dequeueReusableCell(of: TitleHeaderCell.self, for: self, at: index) as? TitleHeaderCell else {
                fatalError()
            }
            cell.titleLabel.text = "Summary"
            return cell
        }
        guard let cell = collectionContext?.dequeueReusableCell(of: CreditHealthCell.self, for: self, at: index) as? CreditHealthCell else {
            fatalError()
        }
        guard let model = model else { return cell }
        let grouping = Dictionary.init(grouping: model.transactions) { element -> String in
            return element.description ?? "Unknown Transaction"
        }
        var entries: [PieChartDataEntry] = []
        for key in grouping.keys {
            if let transactionGroup = grouping[key] {
                let totalValue = transactionGroup.reduce(0) { result, transaction in (transaction.postBalance ?? 0)}
                entries.append(PieChartDataEntry(value: totalValue, label: key))
            }
        }
        cell.setDataCount(entries: entries)
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? CreditHealthModel
    }
}
