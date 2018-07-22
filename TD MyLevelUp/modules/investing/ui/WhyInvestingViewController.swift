import Foundation
import UIKit

public class WhyInvestingViewController: BaseCollectionViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        present(SearchSymbolViewController(), animated: true, completion: nil)
    }
}
