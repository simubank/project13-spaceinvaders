import Foundation
import IGListKit

open class TopGainersSectionController: ListSectionController {
    private var object: String?
    
    open override func numberOfItems() -> Int {
        return 6
    }
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width / 3, height: collectionContext.containerSize.height / 2)
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: StockQuoteCell.self, for: self, at: index) as? StockQuoteCell else {
            fatalError()
        }
        return cell
    }
    
    open override func didUpdate(to object: Any) {
        self.object = object as? String
    }
    
    open override func didSelectItem(at index: Int) {
        
    }
}
