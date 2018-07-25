import Foundation
import IGListKit
import SafariServices

public class CardRecommendationController: ListSectionController, SFSafariViewControllerDelegate {
    open var model: CreditCardRecommendation?
    
    open override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: 120)
    }
    
    open override func numberOfItems() -> Int {
        guard let model = model else { return 0 }
        return model.recommendations.count
    }
    
    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?
            .dequeueReusableCell(of: CreditCardRecommendationCell.self, for: self, at: index) as? CreditCardRecommendationCell,
            let model = model else { fatalError()}
                cell.accountBalanceLabel.text = "Based on your transactions, income and credit. We recommend the \(model.recommendations[index].rawValue)."
                cell.cardImageView.image = UIImage(named: model.recommendations[index].rawValue)
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? CreditCardRecommendation
    }
    public override func didSelectItem(at index: Int) {
        guard let model = model else { return }
        let controller = SFSafariViewController(url: URL(string: model.recommendations[index].url)!)
        controller.delegate = self
        viewController?.present(controller, animated: true, completion: nil)
    }
    
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
