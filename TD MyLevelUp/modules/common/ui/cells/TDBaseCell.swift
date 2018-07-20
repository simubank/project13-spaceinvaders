import UIKit

open class TDBaseCell: UICollectionViewCell {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        prepareViews()
    }
    
    /// Called to notify the class to prepare views (ie setup constraints)
    open func prepareViews() {
        // Base cell does not need to do any configuration
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
