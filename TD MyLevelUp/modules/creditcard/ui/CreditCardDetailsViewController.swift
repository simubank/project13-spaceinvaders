import Foundation
import IGListKit

public class CreditCardDetailsViewController: BaseCollectionViewController {
    public var account: CreditCardAccount!
    public var transactions: [Transaction] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    public override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects: [ListDiffable] = []
        objects.append(account)
        if !transactions.isEmpty {
            objects.append(TransactionListHolder(transactions: transactions))
        }
        return objects
    }
    
    public override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is CreditCardAccount {
            return CreditCardSummaryController(shouldNavigate: false)
        }
        return TransactionController()
    }
}
