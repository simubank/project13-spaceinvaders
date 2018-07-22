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
    
    var recommendedAccount: PersonalAccount? {
        didSet {
            let normalText = "Based on your account information, the account that would suit you best is a(n) "
            let accountText  = "\(recommendedAccount?.accountName.rawValue ?? "") account."
            let attributedString = NSMutableAttributedString(string: normalText)
            
            let attrs = [NSAttributedStringKey.font : UIFont.bold,
                         NSAttributedStringKey.foregroundColor: UIColor.primaryLight]
            let boldString = NSMutableAttributedString(string: accountText, attributes: attrs)
            
            attributedString.append(boldString)
            recommendedAccountLabel.attributedText = attributedString
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
    
    public lazy var recommendationsHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "What we recommend"
        label.textColor = .black
        label.font = .bold(withSize: 30.0)
        view.addSubview(label)
        return label
    }()
    
    public lazy var recommendedAccountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .medium(withSize: 15.0)
        label.numberOfLines = 0
        view.addSubview(label)
        return label
    }()
    
    public lazy var learnMoreButton: UIButton = {
        let button = UIButton()
        button.tintColor = .primary
        button.titleLabel?.font = .bold
        button.setTitle("Learn More", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .primary
        view.addSubview(button)
        return button
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
        
        recommendationsHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(accountBalanceLabel).offset(60)
            $0.left.equalTo(accountsHeaderLabel)
        }
        
        recommendedAccountLabel.snp.makeConstraints {
            $0.top.equalTo(recommendationsHeaderLabel).offset(50)
            $0.left.equalTo(accountsHeaderLabel)
            $0.right.equalTo(-8)
        }
        
        learnMoreButton.snp.makeConstraints {
            $0.top.equalTo(recommendedAccountLabel).offset(70)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(15)
            $0.right.equalTo(-15)
            $0.height.equalTo(60)
        }
    }
    
    private func getAccountInfo() {
        VirtualBankService.request(.accounts(user: AccountManager.shared.id)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Accounts>.self) else { return }
                // FIXME : Use all accounts instead of first one
                self.account = response.result?.bankAccounts?[0]
                self.recommendedAccount = self.determineRecommendedAccount()
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func determineRecommendedAccount() -> PersonalAccount? {
        
        guard let accountBalance = account?.balance else { return nil }
        
        switch accountBalance {
        case 2000..<3000:
            return PersonalAccounts.minimumChequing
        case 3000..<4000:
            return PersonalAccounts.everyDayChequing
        case 4000..<5000:
            return PersonalAccounts.unlimitedChequing
        case 5000...:
            return PersonalAccounts.allInclusiveBanking
        default:
            return PersonalAccounts.minimumChequing
        }
        
    }
    
    @objc func handleButtonClick() {
        guard let moreInfoURL = recommendedAccount?.moreInfoURL else { return }
        UIApplication.shared.open(moreInfoURL, options: [:], completionHandler: nil)
    }
}
