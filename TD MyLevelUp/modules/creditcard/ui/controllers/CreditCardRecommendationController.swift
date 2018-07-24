import Foundation
import IGListKit
import SafariServices

public class CreditCardRecommendation: NSObject {
    public let recommendation: TDCreditCard
    
    public init(recommendation: TDCreditCard) {
        self.recommendation = recommendation
    }
}

public class CreditCardRecommendationController: ListSectionController, SFSafariViewControllerDelegate {
    open var model: CreditCardRecommendation?
    
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
        guard let cell = collectionContext?
            .dequeueReusableCell(of: CreditCardRecommendationCell.self, for: self, at: index) as? CreditCardRecommendationCell,
        let model = model else { fatalError()}
        cell.accountBalanceLabel.text = "Based on your transactions, income and credit. We recommend the \(model.recommendation.rawValue)."
        cell.cardImageView.image = UIImage(named: model.recommendation.rawValue)
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? CreditCardRecommendation
    }
    public override func didSelectItem(at index: Int) {
        guard let model = model else { return }
        let controller = SFSafariViewController(url: URL(string: model.recommendation.url)!)
        controller.delegate = self
        viewController?.present(controller, animated: true, completion: nil)
    }
    
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
