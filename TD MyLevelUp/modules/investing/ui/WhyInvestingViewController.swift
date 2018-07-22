import Foundation
import UIKit

public class WhyInvestingViewController: BaseCollectionViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let controller = SearchSymbolViewController()
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
}

extension WhyInvestingViewController: SearchSymbolDelegate {
    public func search(viewcontroller: SearchSymbolViewController, didSelect stock: YahooStock) {
        print("select \(stock.symbol)")
    }
}
