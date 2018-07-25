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

//import Foundation
//import UIKit
//import EFCountingLabel
//
//class AccountsWidgetView: DashboardWidgetView, AccountsWidgetViewContract {
//
//    var account: Account? {
//        didSet {
//            guard let balance = account?.balance else { return }
//            guard let currency = account?.currency else { return }
//            guard let type = account?.type else { return }
//            accountsBalanceLabel.countFrom(0, to: CGFloat(balance), withDuration: 1.0)
//            accountCurrencyLabel.text = currency
//            accountTypeLabel.text = type
//        }
//    }
//
//    public lazy var accountsWidgetHeaderLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Balances"
//        label.font = .heavy(withSize: 30.0)
//        addSubview(label)
//        return label
//    }()
//
//    public lazy var accountTypeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "SDA"
//        addSubview(label)
//        return label
//    }()
//
//    public lazy var accountsBalanceLabel: EFCountingLabel = {
//        let label = EFCountingLabel()
//        label.format = "$%.2f"
//        label.text = "$0.0"
//        label.font = .medium(withSize: 32.0)
//        addSubview(label)
//        return label
//    }()
//
//    public lazy var accountCurrencyLabel: UILabel = {
//        let label = UILabel()
//        label.text = "CAD"
//        label.font = .medium(withSize: 32.0)
//        addSubview(label)
//        return label
//    }()
//
//    public lazy var moreInfoLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.text = "Tap to see how the rest of your accounts are doing. ☺️"
//        label.font = .standard(withSize: 18.0)
//        addSubview(label)
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        accountsWidgetHeaderLabel.snp.makeConstraints { make in
//            make.top.equalTo(8)
//            make.left.equalTo(8)
//        }
//
//        accountTypeLabel.snp.makeConstraints { make in
//            make.top.equalTo(accountsWidgetHeaderLabel.snp.bottom).offset(23)
//            make.left.equalTo(8)
//        }
//
//        accountsBalanceLabel.snp.makeConstraints { make in
//            make.top.equalTo(accountsWidgetHeaderLabel.snp.bottom).offset(15)
//            make.left.equalTo(accountTypeLabel.snp.right).offset(20)
//        }
//
//        accountCurrencyLabel.snp.makeConstraints { make in
//            make.top.equalTo(accountsBalanceLabel)
//            make.left.equalTo(accountsBalanceLabel.snp.right).offset(10)
//        }
//
//        moreInfoLabel.snp.makeConstraints { make in
//            make.top.equalTo(accountTypeLabel).offset(30)
//            make.left.equalTo(8)
//            make.right.equalTo(8)
//        }
//
//    }
//
//    public func updateAccountBalance(account: Account?) {
//        guard let userAccount = account else { return }
//        self.account = userAccount
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//}
