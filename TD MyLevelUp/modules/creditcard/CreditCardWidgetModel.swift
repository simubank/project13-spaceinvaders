import Foundation
import UIKit

public class CreditCardWidgetModel: NSObject, DashboardWidgetModel {
    public var icon: UIImage? = UIImage()
    
    public let title: String = "Credit Cards"
    
    public let contentView: DashboardWidgetView
    
    public let presenter: CreditCardWidgetPresenter
    
    public override init() {
        presenter = CreditCardWidgetPresenter()
        let view = CreditCardWidgetView()
        presenter.view = view
        contentView = view
        super.init()
    }
    
    public func openWidget(with viewcontroller: UIViewController) {
        
    }
}
