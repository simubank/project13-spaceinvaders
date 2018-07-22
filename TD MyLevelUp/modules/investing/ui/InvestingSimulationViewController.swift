import Foundation
import MBProgressHUD
import IGListKit

public class InvestingSimulationViewController: BaseCollectionViewController {
    public let presenter = InvestingSimulationPresenter()
    var objectsForList: [ListDiffable] = []
    public override func viewDidLoad() {
        super.viewDidLoad()
        let controller = SearchSymbolViewController()
        controller.delegate = self
        present(controller, animated: true, completion: nil)
        presenter.view = self
        presenter.onViewReady()
    }
    
    public override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objectsForList
    }
    public override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return StockPurchaseController()
    }
}

extension InvestingSimulationViewController: InvestingSimulationView {
    public func simulationDidFinishAnalzing(_ presenter: InvestingSimulationPresenter, trades: [InvestingSimulationTransaction]) {
        MBProgressHUD.hide(for: self.view, animated: true)
        objectsForList = trades
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    public func simulation(_ presenter: InvestingSimulationPresenter, didUpdate transactions: [Transaction]) {
        print(transactions.count)
    }
}

extension InvestingSimulationViewController: SearchSymbolDelegate {
    public func search(viewcontroller: SearchSymbolViewController, didSelect stock: YahooStock) {
        presenter.onUpdatedSymbol(stock.symbol)
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Analyizing Transactions..."
    }
}
