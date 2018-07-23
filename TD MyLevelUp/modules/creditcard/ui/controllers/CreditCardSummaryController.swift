import Foundation
import IGListKit

public class CreditCardSummaryController: ListSectionController {
    
    public var model: CreditCardAccount?
    
    public override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CreditCardSummaryCell.self,
                                                                for: self, at: index) as? CreditCardSummaryCell, let model = model else {
                                                                    fatalError()
        }
        cell.creditCardNameLabel.text = "\(model.type ?? "") - \(model.maskedNumber ?? "")"
        cell.balanceLabel.text = "$\(model.balance ?? 0)"
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? CreditCardAccount
    }
    
    public override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: collectionContext.containerSize.height)
    }
    
    public override func didSelectItem(at index: Int) {
        guard let model = model else { return }
        let controller = CreditCardDetailsViewController()
        controller.account = model
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
