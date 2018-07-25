import Foundation
import UIKit

public class WhyInvestingViewController: BaseCollectionViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.pushViewController(InvestingSimulationViewController(), animated: true)
    }
}
