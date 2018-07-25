import Foundation
import UIKit
import IGListKit

public class InvestmentViewController: BaseCollectionViewController {
    var intents: [InvestingIntent]?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Investing"
        collectionView.backgroundColor = .background
    }
    
    public override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let intents = intents else { return [] }
        var objects: [InvestingPromotionItem] = []
        for intent in intents {
            objects.append(InvestingPromotionItem(intent: intent, image: UIImage(named: "investing_banner_\(intents.index{ $0 === intent} ?? 0)")))
        }
        return objects
    }
    
    public override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return FixedPromotionSectionController()
    }
}
