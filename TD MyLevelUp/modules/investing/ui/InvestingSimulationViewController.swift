import Foundation
import MBProgressHUD
import IGListKit
import Charts

public class InvestingSimulationViewController: BaseCollectionViewController {
    public let presenter = InvestingSimulationPresenter()
    var objectsForList: [ListDiffable] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Investing Simulation"
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
        if object is CandleStickChartModel {
            return CandleStickChartController()
        } else if object is InvestingResultSummary {
            return InvestingResutlsController()
        } else if object is String {
            return TitleHeaderController()
        } else {
            return StockPurchaseController()
        }
    }
}

extension InvestingSimulationViewController: InvestingSimulationView {
    public func simulationDidFinishAnalzing(_ presenter: InvestingSimulationPresenter, trades: [InvestingSimulationTransaction], historicalData: [CandleChartDataEntry], summary: InvestingResultSummary) {
        MBProgressHUD.hide(for: self.view, animated: true)
        objectsForList.append("Results" as ListDiffable)
        objectsForList.append(summary as ListDiffable)
        objectsForList.append("Historical Prices of \(trades[0].stockSymbol)" as ListDiffable)
        objectsForList.append(CandleStickChartModel(stockName: trades[0].stockSymbol, data: historicalData) as ListDiffable)
        objectsForList.append("Trades to be made" as ListDiffable)
        objectsForList.append(contentsOf: trades)
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
