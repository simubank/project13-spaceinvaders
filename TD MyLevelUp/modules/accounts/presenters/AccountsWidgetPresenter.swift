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
        VirtualBankService.request(.accounts(user: AccountManager.shared.id)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Accounts>.self) else { return }
                // FIXME : Use all accounts instead of first one
                self.account = response.result?.bankAccounts?[0]
            case let .failure(error):
                print(error)
            }
        }
    }
}
