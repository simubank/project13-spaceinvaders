import Foundation
import IGListKit

public class TransactionListHolder: NSObject {
    public let transactions: [Transaction]
    public init(transactions: [Transaction]) {
        self.transactions = transactions
    }
}

public class TransactionController: ListSectionController {
    open var model: TransactionListHolder?
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: 60)
    }
    
    public override func numberOfItems() -> Int {
        return (model?.transactions.count ?? 0) + 1
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        if index == 0 {
            guard let cell = collectionContext?.dequeueReusableCell(of: TitleHeaderCell.self, for: self, at: index) as? TitleHeaderCell else {
                fatalError()
            }
            cell.titleLabel.text = "Transactions"
            return cell
        } else {
            guard let cell = collectionContext?.dequeueReusableCell(of: TransactionCell.self, for: self, at: index) as? TransactionCell else {
                fatalError()
            }
            guard let model = model else { return cell }
            let transaction = model.transactions[index + 1]
            cell.nameLabel.text = transaction.description
            cell.balanceLabel.text = "$\(transaction.postBalance ?? 0)"
            return cell
        }
    }
    
    open override func didUpdate(to object: Any) {
        model = object as? TransactionListHolder
    }
}
