import Foundation
import UIKit
import EFCountingLabel

class AccountsWidgetView: DashboardWidgetView, AccountsWidgetViewContract {
    
    var account: Account? {
        didSet {
            guard let balance = account?.balance else { return }
            guard let currency = account?.currency else { return }
            accountsBalanceLabel.countFrom(0, to: CGFloat(balance), withDuration: 1.0)
            accountCurrencyLabel.text = currency
        }
    }
    
    public lazy var accountsWidgetHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance"
        label.font = .heavy(withSize: 40.0)
        addSubview(label)
        return label
    }()
    
    public lazy var accountsBalanceLabel: EFCountingLabel = {
        let label = EFCountingLabel()
        label.format = "$%.1f"
        label.text = "$0.0"
        label.font = .medium(withSize: 32.0)
        addSubview(label)
        return label
    }()
    
    public lazy var accountCurrencyLabel: UILabel = {
       let label = UILabel()
        label.text = "CAD"
        label.font = .medium(withSize: 32.0)
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        accountsWidgetHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(8)
        }
        
        accountsBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(accountsWidgetHeaderLabel.snp.bottom).offset(15)
            make.left.equalTo(8)
        }
        
        accountCurrencyLabel.snp.makeConstraints { make in
            make.top.equalTo(accountsBalanceLabel)
            make.left.equalTo(accountsBalanceLabel.snp.right).offset(10)
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
