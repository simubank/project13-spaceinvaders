import Foundation
import IGListKit

public class CreditCardRecommendation: NSObject {
    
}

public class CreditCardRecommendationController: ListSectionController {
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
            cell.titleLabel.text = "Recommendations"
            return cell
        }
        guard let cell = collectionContext?.dequeueReusableCell(of: CreditCardRecommendationCell.self, for: self, at: index) as? CreditCardRecommendationCell else { fatalError()}
        cell.cardImageView.image = UIImage(named: TDCreditCard.cashBackInfinite.rawValue)
        return cell
    }
}
