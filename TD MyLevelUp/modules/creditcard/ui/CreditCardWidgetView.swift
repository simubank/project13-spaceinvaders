import Foundation
import UIKit
import IGListKit
import SnapKit

public class CreditCardWidgetView: DashboardWidgetView, CreditCardWidgetViewContract {
    /// The Adapter used for the IGListKit Collection View.
    public var adapter: ListAdapter?
    
    override public var viewcontroller: UIViewController! {
        didSet {
            adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: viewcontroller)
            adapter?.dataSource = self
            adapter?.collectionView = collectionView
            adapter?.scrollViewDelegate = self
        }
    }
    
    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.currentPage = 0
        view.pageIndicatorTintColor = .darkGray
        view.currentPageIndicatorTintColor = .white
        addSubview(view)
        return view
    }()
    
    /// Collection view that fills the controller.
    public lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        view.alwaysBounceVertical = false
        view.backgroundColor = .background
        view.alwaysBounceHorizontal = true
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        addSubview(view)
        return view
    }()
    
    var intents: [CreditCardAccount] = [] {
        didSet {
            pageControl.numberOfPages = intents.count
            pageControl.currentPage = 0
        }
    }
    
    public override func prepareView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    public func creditCard(_ presenter: CreditCardWidgetPresenter, didRecieve accounts: [CreditCardAccount]) {
        intents = accounts
        adapter?.performUpdates(animated: true, completion: nil)
    }
}

extension CreditCardWidgetView: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if currentPage >= 0 && currentPage < intents.count {
            pageControl.currentPage = currentPage
        }
    }
}

extension CreditCardWidgetView: ListAdapterDataSource {
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return intents
    }
    
    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CreditCardSummaryController()
    }
    
    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
