import Foundation
import UIKit

public class InvestingWidgetModel: NSObject, DashboardWidgetModel {
    public var icon: UIImage? = UIImage(named: "investing_icon_small")
    
    public let title: String = "Investing"
    
    public let contentView: DashboardWidgetView
    
    public let presenter: InvestingWidgetPresenter
    
    public func openWidget(with viewcontroller: UIViewController) {
        let controller = InvestmentViewController()
        controller.intents = presenter.intents
        viewcontroller.navigationController?.pushViewController(controller, animated: true)
    }
    
    public override init() {
        presenter = InvestingWidgetPresenter()
        let view = InvestingWidgetView()
        presenter.view = view
        contentView = view
        super.init()
    }
}
