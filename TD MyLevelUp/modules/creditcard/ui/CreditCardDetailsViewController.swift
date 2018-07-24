import Foundation
import IGListKit

public class CreditCardDetailsViewController: BaseCollectionViewController {
    public var account: CreditCardAccount!
    public var transactions: [Transaction] = []
    public var totalBalanceNetworth: Double?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Credit Card Details"
        VirtualBankService.request(.transactionsFor(account: account.id)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<[Transaction]>.self) else { return }
                self.transactions = response.result ?? []
                self.adapter.performUpdates(animated: true, completion: nil)
            case let .failure(error):
                print(error)
            }
        }
        VirtualBankService.request(.accounts(user: AccountManager.shared.id)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Accounts>.self) else { return }
                if let accounts = response.result?.bankAccounts {
                    self.totalBalanceNetworth = 0
                    for account in accounts {
                        self.totalBalanceNetworth = (self.totalBalanceNetworth ?? 0) + (account.balance ?? 0)
                    }
                    self.adapter.performUpdates(animated: true, completion: nil)
                }
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
    public override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects: [ListDiffable] = []
        objects.append(account)
        if !transactions.isEmpty {
            objects.append(CreditHealthModel(transactions: transactions))
        }
        if let totalBalanceNetworth = totalBalanceNetworth, totalBalanceNetworth > 60000 {
            objects.append(CreditCardRecommendation(recommendations: [TDCreditCard.cashBackInfinite, TDCreditCard.usDollarCard]))
        } else {
            objects.append(CreditCardRecommendation(recommendations: [TDCreditCard.cashBackVisa]))
        }
        if !transactions.isEmpty {
            objects.append(TransactionListHolder(transactions: transactions))
        }
        return objects
    }
    
    public override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is CreditCardAccount {
            return CreditCardSummaryController(shouldNavigate: false)
        } else if object is CreditHealthModel {
            return CreditHealthController()
        } else if object is CreditCardRecommendation {
            return CreditCardRecommendationController()
        }
        return TransactionController()
    }
}
