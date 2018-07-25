import UIKit

/// A protocol that allows UIElements to have TDShadows
public protocol TDShadowable {
    /// Adds a Howdi App Specific Shadow.
    func addTdShadow(opacity: Float, height: CGFloat)
    
    /// Removes a Howdi App Specific Shadow
    func hideTdShadow()
}

/// Extend all UIViews to have default implementation.
public extension TDShadowable where Self: UIView {
    public func addTdShadow(opacity: Float = 0.13, height: CGFloat = 5) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: height)
        layer.shadowRadius = 5
    }
    
    public func hideTdShadow() {
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 0
    }
}

/// Automatically make UIViews have
extension UIView: TDShadowable {
    // Make all UIViews TDShadowable
}
