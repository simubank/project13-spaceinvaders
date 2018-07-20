import Foundation
import UIKit
import IGListKit

public class InvestmentViewController: BaseCollectionViewController {
    var intents: [InvestingIntent]?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .background
        
        AlphaVantageService.request(.historicalPrices(symbol: "MSFT")) { result in
            // TODO
        }
    }
    
    public override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let intents = intents else { return [] }
        var objects: [InvestingPromotionItem] = []
        for intent in intents {
            objects.append(InvestingPromotionItem(message: intent.messageSnippet, image: UIImage(named: "investing_banner_\(intents.index{ $0 === intent} ?? 0)"), buttonText: intent.buttonText))
        }
        return objects
    }
    
    public override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return FixedPromotionSectionController()
    }
}
