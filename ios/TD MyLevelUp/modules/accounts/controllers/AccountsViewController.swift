import Foundation
import UIKit
import SnapKit

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var accounts = [Account]()
    var recommendedText: String = "Based on your account information, the account that would suit you best is a(n) "
    
    var recommendedAccount: PersonalAccount? {
        didSet {
            let normalText = recommendedText
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
        label.text = "Account Balances"
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
    
    public lazy var accountBalancesTableView: UITableView = {
        var tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    public lazy var accountRecommendationView: UIView = {
        var recView = UIView()
        view.addSubview(recView)
        return recView
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
        getAccountInfo()
        setupView()
    }
    
    public func setupView() {
        view.backgroundColor = .white
        
        accountsHeaderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(130)
            $0.left.equalTo(20)
        }
        
        accountBalancesTableView.delegate = self
        accountBalancesTableView.dataSource = self
        accountBalancesTableView.rowHeight = UITableViewAutomaticDimension
        accountBalancesTableView.estimatedRowHeight = UITableViewAutomaticDimension
        accountBalancesTableView.register(AccountCell.self, forCellReuseIdentifier: "AccountCell")
        accountBalancesTableView.snp.makeConstraints {
            $0.top.equalTo(accountsHeaderLabel).offset(50)
            $0.left.equalTo(0)
            $0.right.equalTo(0)
            $0.height.greaterThanOrEqualTo(200)
        }
        
        recommendedAccountLabel.snp.makeConstraints {
            $0.top.equalTo(accountBalancesTableView.snp.bottom).offset(30)
            $0.left.equalTo(accountsHeaderLabel)
            $0.right.equalTo(-8)
        }

        learnMoreButton.snp.makeConstraints {
            $0.top.equalTo(recommendedAccountLabel).offset(70)
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
               
                guard let accounts = response.result?.bankAccounts else { return }
                self.accounts = accounts
                self.recommendedAccount = self.determineRecommendedAccount()
                self.accountBalancesTableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func determineRecommendedAccount() -> PersonalAccount? {
        
        let accountBalances = accounts.map{ $0.balance ?? 0.00 }
        guard let maxAccountBalance = accountBalances.max() else { return nil }
        
        switch maxAccountBalance {
        case 2000..<3000:
            recommendedText = "You seem to have over $2000 in your balances. Maybe you would be interested in a(n) "
            return PersonalAccounts.minimumChequing
        case 3000..<4000:
            recommendedText = "You seem to have over $3000 in your balances. Maybe you would be interested in a(n) "
            return PersonalAccounts.everyDayChequing
        case 4000..<5000:
            recommendedText = "You seem to have over $4000 in your balances. Maybe you would be interested in a(n) "
            return PersonalAccounts.unlimitedChequing
        case 5000...:
            recommendedText = "Because your balance is over $5000, you can take advantage of the rebate and get the "
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

extension AccountsViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AccountCell(style: UITableViewCellStyle.default, reuseIdentifier: "AccountCell")
        
        cell.type.text = accounts[indexPath.row].type ?? ""
        cell.balance.text = "\(String(format: "$%.2f", accounts[indexPath.row].balance?.round() ?? 0.00)) \(accounts[indexPath.row].currency ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
