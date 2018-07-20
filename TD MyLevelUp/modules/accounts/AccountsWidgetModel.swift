import Foundation
import UIKit

public class AccountsWidgetModel: NSObject, DashboardWidgetModel {
    public var icon: UIImage? = UIImage()
    
    public let title: String = "Accounts"
    
    public let contentView: UIView = UIView()
    
    public func openWidget(with viewcontroller: UIViewController) {
        // TODO
    }
}
