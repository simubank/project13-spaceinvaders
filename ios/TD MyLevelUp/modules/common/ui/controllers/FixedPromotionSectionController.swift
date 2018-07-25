import Foundation
import UIKit

open class FixedPromotionSectionController: PromotionSectionController {
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: 250)
    }
}
