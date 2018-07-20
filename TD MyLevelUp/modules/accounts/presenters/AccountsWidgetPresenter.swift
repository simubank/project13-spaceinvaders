import Foundation

public protocol AccountsWidgetViewContract {
    func updateAccountBalance(account: Account?)
}

public class AccountsWidgetPresenter {
    
    var account: Account? {
        didSet {
            view?.updateAccountBalance(account: account)
        }
    }
    
    public var view: AccountsWidgetViewContract? {
        didSet {
            view?.updateAccountBalance(account: account)
        }
    }
    
    public init() {
        VirtualBankService.request(.accounts) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Account>.self) else { return }
                guard let userAccount = response.result else { return }
                self.account = userAccount
            case let .failure(error):
                print(error)
            }
        }
    }
}
