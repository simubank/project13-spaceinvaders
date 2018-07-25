import Foundation
import IGListKit

public class SymbolSearchResultController: ListSectionController {
    public var result: YahooStock?
    
    public override func didUpdate(to object: Any) {
        result = object as? YahooStock
    }
    
    public override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: SymbolSearchResultCell.self, for: self, at: index) as? SymbolSearchResultCell else {
            fatalError()
        }
        cell.symbolLabel.text = result?.symbol
        cell.stockName.text = result?.name
        cell.stockTypeLabel.text = result?.exchDisp
        return cell
    }
    
    public override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: 60)
    }
    
    public override func didSelectItem(at index: Int) {
        guard let viewController = viewController as? SearchSymbolViewController, let result = result  else { return }
        viewController.dismiss(animated: true) {
            viewController.delegate?.search(viewcontroller: viewController, didSelect: result)
        }
    }
}
