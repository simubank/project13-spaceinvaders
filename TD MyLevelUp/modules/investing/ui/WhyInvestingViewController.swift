import Foundation
import UIKit

public class WhyInvestingViewController: BaseCollectionViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        collectionView.backgroundColor = .red
        
        YahooService.request(.search(symbol: "TD")) { result in
            switch result {
            case .success(let moyaResponse):
                guard let response = moyaResponse.mapObject(YahooSearchSymbolRs.self) else { return }
                print(response.payload.result.count)
            case .failure(let error):
                print(error)
            }
        }
    }
}
