import Foundation
import IGListKit

public class CreditCardRecommendation: NSObject {
    public let recommendations: [TDCreditCard]
    
    public init(recommendations: [TDCreditCard]) {
        self.recommendations = recommendations
    }
}

public class CreditCardRecommendationController: ListSectionController {
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    open var model: CreditCardRecommendation?
    open var pageControls: UIPageControl?
    
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
            .dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as? EmbeddedCollectionViewCell else { fatalError()}
        pageControls = cell.pageControl
        pageControls?.currentPage = 0
        pageControls?.numberOfPages = model?.recommendations.count ?? 0
        adapter.collectionView = cell.collectionView
        adapter.scrollViewDelegate = self
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? CreditCardRecommendation
    }
}

extension CreditCardRecommendationController: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let model = model?.recommendations else { return }
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if currentPage >= 0 && currentPage < model.count {
            pageControls?.currentPage = currentPage
        }
    }
}

extension CreditCardRecommendationController: ListAdapterDataSource {
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let model = model else { return [] }
        return [model]
    }
    
    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CardRecommendationController()
    }
    
    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
