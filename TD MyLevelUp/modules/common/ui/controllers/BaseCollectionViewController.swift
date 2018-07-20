import UIKit
import IGListKit
import SnapKit

open class BaseCollectionViewController: UIViewController {
    /// The Adapter used for the IGListKit Collection View.
    public lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    /// Indicates whether or not there is a nav bar on this view.
    open var hasNavBar: Bool {
        return false
    }
    
    /// Options for the page to reload or not.
    open var canPageReload: Bool {
        return false
    }
    
    /// Sets the top padding of the collection view.
    open var customTopHeight: Double {
        return 0
    }
    
    /// Holder for a default load more spinner token
    open let spinToken = "spinner"
    
    /// Indicates whether or not the page is loading
    open var loading = false
    
    /// Collection view that fills the controller.
    open lazy var  collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .background
        view.alwaysBounceVertical = true
        return view
    }()
    
    open lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.tintColor = .primary
        view.addTarget(self, action: #selector(loadData), for: .valueChanged)
        return view
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(hasNavBar ? kDefaultNavHeight : customTopHeight)
            make.bottom.equalTo(0)
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
        if canPageReload {
            collectionView.addSubview(refreshControl)
        }
        isHeroEnabled = true
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }
    
    @objc open func loadData() {
        reloadPage { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
    
    open func reloadPage(finishedLoading: (() -> Void)?) {
        // TO BE OVERRIDEN BY SUBCLASS
        finishedLoading?()
    }
    
    open func loadMoreItems(preLoadingSetup: () -> Void, postLoadingActions: @escaping () -> Void) {
        // To be overriden by subclass.
    }
}

extension BaseCollectionViewController: UIScrollViewDelegate {
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                          withVelocity velocity: CGPoint,
                                          targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if !loading && distance < 200 {
            loadMoreItems(preLoadingSetup: {
                self.loading = true
                self.adapter.performUpdates(animated: true, completion: nil)
            }, postLoadingActions: {
                self.loading = false
                self.adapter.performUpdates(animated: true, completion: nil)
            })
        }
    }
}

extension BaseCollectionViewController: ListAdapterDataSource {
    
    /// Method should be overriden by subclass
    open func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return []
    }
    
    /// Method should be overriden by subclass
    open func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ListSectionController()
    }
    
    /// Method should be overriden by subclass
    open func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
