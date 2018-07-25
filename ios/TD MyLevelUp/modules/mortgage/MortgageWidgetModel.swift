import Foundation
import UIKit

public class MortgageWidgetModel: NSObject, DashboardWidgetModel {
    public var icon: UIImage? = UIImage()
    
    public let title: String = "Mortgage"
    
    public let contentView: DashboardWidgetView = DashboardWidgetView()
    
    public func openWidget(with viewcontroller: UIViewController) {
        // TODO
    }
}
