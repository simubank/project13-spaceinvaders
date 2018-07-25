import Foundation
import IGListKit

public class BankAccountController: ListSectionController {
    open var model: BankAccount?
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width / 3, height: 150)
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: BankAccountCell.self, for: self, at: index) as? BankAccountCell, let model = model else {
            fatalError()
        }
        cell.accountNameLabel.text = model.type
        cell.accountsBalanceLabel
            .countFrom(0, to: CGFloat(model.balance ?? 0), withDuration: 1.0)
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? BankAccount
    }
    
    public override func didSelectItem(at index: Int) {
        viewController?.navigationController?.pushViewController(AccountsViewController(), animated: true)
    }
}
