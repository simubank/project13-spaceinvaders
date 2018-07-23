import UIKit
import IGListKit
import XLActionController

class DashboardViewController: BaseCollectionViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TD MyLevelUp"
        self.updateUser(id: "")
        let testUIBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(DashboardViewController.tappedSettings))
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
    }
    
    @objc public func tappedSettings() {
        let actionController = TwitterActionController()
        actionController.addAction(Action(ActionData(title: "Galen Nevius", subtitle: "49 - Male - Sharing Rent", image: UIImage(named: "male_icon")!), style: .default, handler: { action in
            self.updateUser(id: "1f9e0890-77b5-44ae-a987-03a0a6a1029a_6c8434d3-9d00-45d9-83d6-5c87cc97cdd8")
        }))
        actionController.addAction(Action(ActionData(title: "Yuette Mccallion", subtitle: "43 - Female - FullTime - Renting", image: UIImage(named: "female_icon")!), style: .default, handler: { action in
            self.updateUser(id: "1f9e0890-77b5-44ae-a987-03a0a6a1029a_85a09159-bda3-426a-bcd3-00532807d1df")
        }))
        actionController.addAction(Action(ActionData(title: "Ivana Easom", subtitle: "38 - Female - In School - Renting", image: UIImage(named: "female_icon")!), style: .default, handler: { action in
            self.updateUser(id: "1f9e0890-77b5-44ae-a987-03a0a6a1029a_e2ba9727-a181-48f6-a1bc-0abf5ce173a2")
        }))
        actionController.addAction(Action(ActionData(title: "Frank Nerlinski", subtitle: "34 - Female - Barista - Renting", image: UIImage(named: "female_icon")!), style: .default, handler: { action in
            self.updateUser(id: "1f9e0890-77b5-44ae-a987-03a0a6a1029a_f19107d0-3995-4006-a42d-fc7dced91fcb")
        }))
        actionController.addAction(Action(ActionData(title: "Taylah Basora", subtitle: "51 - Female - Barista - Sharing Rent", image: UIImage(named: "female_icon")!), style: .default, handler: { action in
            self.updateUser(id: "1f9e0890-77b5-44ae-a987-03a0a6a1029a_46ecc00a-84f5-4b64-a1fa-4354edeba8c4")
        }))
        actionController.addAction(Action(ActionData(title: "Rishi (Stubbed)", subtitle: "22 - Male - Developer - Living with Parents", image: UIImage(named: "male_icon")!), style: .default, handler: { action in
            self.updateUser(id: "")
        }))
        actionController.headerData = "Accounts"
        present(actionController, animated: true, completion: nil)
    }
    
    private func updateUser(id: String) {
        AccountManager.shared.id = id
        VirtualBankService.request(.customer(id: AccountManager.shared.id)) { result in
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
    }
    
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let name = name else { return [] }
        return ["Welcome \(name)!" as ListDiffable] + [AccountsWidgetModel(),
                 CreditCardWidgetModel(),
                 MortgageWidgetModel(),
                 InvestingWidgetModel()] as [ListDiffable]
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
