import Foundation
import UIKit

class AccountsViewController: UIViewController {
    var balance: Double?
    var currency: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Your Accounts"
        
        VirtualBankService.request(.accounts) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Account>.self) else {
                    return
                }
                guard let result = response.result else { return }
                self.balance = result.balance
                self.currency = result.currency
                
            case let .failure(error):
                print(error)
            }
        }
    }
}
