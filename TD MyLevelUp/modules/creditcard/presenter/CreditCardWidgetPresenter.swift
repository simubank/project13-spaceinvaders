import Foundation

public protocol CreditCardWidgetViewContract {
    func creditCard(_ presenter: CreditCardWidgetPresenter, didRecieve accounts: [CreditCardAccount])
}
public class CreditCardWidgetPresenter {
    public var creditCardAccounts: [CreditCardAccount]?
    public var view: CreditCardWidgetViewContract? {
        didSet {
            view?.creditCard(self, didRecieve: creditCardAccounts ?? [])
        }
    }
    
    init() {
        VirtualBankService.request(.accounts(user: AccountManager.shared.id)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Accounts>.self) else { return }
                self.onRecievedCreditCards(accounts: response.result?.creditCardAccounts)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    public func onRecievedCreditCards(accounts: [CreditCardAccount]?) {
        guard let accounts = accounts else { return }
        creditCardAccounts = accounts
        view?.creditCard(self, didRecieve: accounts)
    }
}
