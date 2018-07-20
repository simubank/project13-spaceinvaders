import UIKit
import IGListKit

class DashboardViewController: BaseCollectionViewController {
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TD MyLevelUp"
        
        VirtualBankService.request(.accounts) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Account>.self) else {
                    return
                }
                VirtualBankService.request(.customer(id: "1f9e0890-77b5-44ae-a987-03a0a6a1029a_6c8434d3-9d00-45d9-83d6-5c87cc97cdd8")) { result in
                    switch result {
                    case let .success(moyaResponse):
                        guard let response = moyaResponse.mapObject(VirtualBankResponse<[Customer]>.self) else {
                            return
                        }
                        self.name = response.result?[0].fullName ?? ""
                        self.adapter.performUpdates(animated: true, completion: nil)
                    case let .failure(error):
                        print(error)
                    }
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects: [ListDiffable] = []
        if let name = name {
            objects.append("Welcome \(name)!" as ListDiffable)
        }
        return objects + [AccountsWidgetModel(),
                 CreditCardWidgetModel(),
                 InvestingWidgetModel(),
                 MortgageWidgetModel()] as [ListDiffable]
    }
    
    override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is String {
            return TitleHeaderController()
        } else if object is DashboardWidgetModel {
            return DashboardWidgetController()
        }
        return ListSectionController()
    }
}
