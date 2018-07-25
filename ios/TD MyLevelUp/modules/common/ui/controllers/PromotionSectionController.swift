import Foundation
import Foundation
import IGListKit

public protocol PromotionItem {
    var backgroundImage: UIImage? { get }
    var promotionText: String { get }
    var buttonText: String? { get }
    func controllerDidSelectItem(_ controller: PromotionSectionController, viewController: UIViewController?)
}

open class PromotionSectionController: ListSectionController {
    open var item: PromotionItem?
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: collectionContext.containerSize.height)
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: PromotionCell.self, for: self, at: index) as? PromotionCell else {
            fatalError()
        }
        cell.promotionLabel.text = item?.promotionText
        cell.backgroundImage.image = item?.backgroundImage
        cell.actionButton.setTitle(item?.buttonText, for: .normal)
        return cell
    }
    
    open override func didUpdate(to object: Any) {
        item = object as? PromotionItem
    }
    
    open override func didSelectItem(at index: Int) {
        item?.controllerDidSelectItem(self, viewController: viewController)
    }
}
