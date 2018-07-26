import Foundation
import UIKit
import IGListKit
import SnapKit

public class AccountsWidgetView: DashboardWidgetView, AccountsWidgetViewContract {
    /// The Adapter used for the IGListKit Collection View.
    public var adapter: ListAdapter?
    
    override public var viewcontroller: UIViewController! {
        didSet {
            adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: viewcontroller)
            adapter?.dataSource = self
            adapter?.collectionView = collectionView
        }
    }
    
    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
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
    
    var accounts: [Account] = []
    
    public override func prepareView() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    public func updateAccounts(_ accounts: [Account]) {
        self.accounts = accounts
        adapter?.performUpdates(animated: true, completion: nil)
    }
}

extension AccountsWidgetView: ListAdapterDataSource {
    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let accounts = accounts as? [BankAccount] else { return [] }
        return accounts
    }
    
    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return BankAccountController()
    }
    
    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
