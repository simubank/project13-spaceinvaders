import Foundation
import UIKit
import SnapKit

class AccountsViewController: UIViewController {
    
    var account: Account? {
        didSet {
            guard let userAccount = account else { return }
            guard let balance = userAccount.balance else { return }
            guard let currency = userAccount.currency else { return }
            accountBalanceLabel.text = "$\(balance) \(currency)"
        }
    }
    
    public lazy var accountsHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Account Balance"
        label.textColor = .black
        label.font = .heavy(withSize: 40.0)
        view.addSubview(label)
        return label
    }()
    
    public lazy var accountBalanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .medium(withSize: 32.0)
        view.addSubview(label)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Your Accounts"
        setupView()
        getAccountInfo()
    }
    
    public func setupView() {
        view.backgroundColor = .white
        
        accountsHeaderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(130)
            $0.left.equalTo(20)
        }
        
        accountBalanceLabel.snp.makeConstraints {
            $0.top.equalTo(accountsHeaderLabel).offset(60)
            $0.left.equalTo(accountsHeaderLabel)
        }
    }
    
    private func getAccountInfo() {
        VirtualBankService.request(.accounts) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Account>.self) else {
                    return
                }
                guard let userAccount = response.result else { return }
                self.account = userAccount
                
            case let .failure(error):
                print(error)
            }
        }
    }
}
