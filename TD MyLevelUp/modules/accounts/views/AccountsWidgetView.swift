import Foundation
import UIKit

class AccountsWidgetView: DashboardWidgetView, AccountsWidgetViewContract {
    
    var account: Account? {
        didSet {
            guard let balance = account?.balance else { return }
            guard let currency = account?.currency else { return }
            accountsBalanceLabel.text = "$\(balance) \(currency)"
        }
    }
    
    public lazy var accountsHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance"
        label.font = .heavy(withSize: 40.0)
        addSubview(label)
        return label
    }()
    
    public lazy var accountsBalanceLabel: UILabel = {
        let label = UILabel()
        label.font = .medium(withSize: 32.0)
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        accountsHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(8)
        }
        
        accountsBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(accountsHeaderLabel.snp.bottom).offset(15)
            make.left.equalTo(8)
        }
        
    }
    
    public func updateAccountBalance(account: Account?) {
        guard let userAccount = account else { return }
        self.account = userAccount
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
