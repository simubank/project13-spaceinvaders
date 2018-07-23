import Foundation
import UIKit

public class CreditCardWidgetModel: NSObject, DashboardWidgetModel {
    public var icon: UIImage? = UIImage()
    
    public let title: String = "Credit Cards"
    
    public let contentView: DashboardWidgetView = CreditCardWidgetView()
    
    public func openWidget(with viewcontroller: UIViewController) {
        // TODO
    }
}
