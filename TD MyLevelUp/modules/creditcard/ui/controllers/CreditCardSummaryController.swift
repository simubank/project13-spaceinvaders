import Foundation
import IGListKit

public class CreditCardSummaryController: ListSectionController {
    
    public var model: CreditCardAccount?
    public let shouldNavigate: Bool
    
    public init(shouldNavigate: Bool = true) {
        self.shouldNavigate = shouldNavigate
        super.init()
    }
    
    public override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CreditCardSummaryCell.self,
                                                                for: self, at: index) as? CreditCardSummaryCell, let model = model else {
                                                                    fatalError()
        }
        cell.creditCardNameLabel.text = "\(model.type ?? "") - \(model.maskedNumber ?? "")"
        cell.balanceLabel.text = "$\(model.balance ?? 0)"
        cell.balanceLabel.countFrom(0, to: CGFloat(model.balance ?? 0), withDuration: 1.0)
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? CreditCardAccount
    }
    
    public override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: shouldNavigate ? collectionContext.containerSize.height : 250)
    }
    
    public override func didSelectItem(at index: Int) {
        guard let model = model else { return }
        if shouldNavigate {
            let controller = CreditCardDetailsViewController()
            controller.account = model
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
