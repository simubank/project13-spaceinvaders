import Foundation
import UIKit

public class DashboardWidgetView: UIView {
    
    public func prepareView() {
        // TO BE OVERRIDEN.
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        prepareView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var viewcontroller: UIViewController!
}
