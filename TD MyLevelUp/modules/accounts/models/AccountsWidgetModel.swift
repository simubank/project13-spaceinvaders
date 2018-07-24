import Foundation
import UIKit

public class AccountsWidgetModel: NSObject, DashboardWidgetModel {
    public var icon: UIImage? = UIImage(named: "accounts_icon_small")
    
    public let title: String = "Banking Accounts"
    
    public let contentView: DashboardWidgetView
    
    public let presenter: AccountsWidgetPresenter
    
    public func openWidget(with viewcontroller: UIViewController) {
        viewcontroller.navigationController?.pushViewController(AccountsViewController(), animated: true)
    }
    
    public override init() {
        presenter = AccountsWidgetPresenter()
        let view = AccountsWidgetView()
        presenter.view = view
        contentView = view
        super.init()
    }
    
    public var preferredHeight: CGFloat {
        return 230.0
    }
}
