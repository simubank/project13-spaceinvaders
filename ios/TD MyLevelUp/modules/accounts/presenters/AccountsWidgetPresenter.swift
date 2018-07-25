import Foundation

public protocol AccountsWidgetViewContract {
    func updateAccounts(_ accounts: [Account])
}

public class AccountsWidgetPresenter {
    
    var accounts: [Account]? {
        didSet {
            view?.updateAccounts(accounts ?? [])
        }
    }
    
    public var view: AccountsWidgetViewContract? {
        didSet {
            view?.updateAccounts(accounts ?? [])
        }
    }
    
    public init() {
        VirtualBankService.request(.accounts(user: AccountManager.shared.id)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Accounts>.self) else { return }
                self.accounts = response.result?.bankAccounts ?? []
            case let .failure(error):
                print(error)
            }
        }
    }
}
