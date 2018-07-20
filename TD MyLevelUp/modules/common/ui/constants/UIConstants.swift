import UIKit

/// MARK : UIContants
public let kDefaultPadding: CGFloat = 20.0
public let kDefaultNavHeight: CGFloat = hasSafeAreaInsets ? 100.0 : 75.0
public let kDefaultNavHeightOffset: CGFloat = hasSafeAreaInsets ? 20.0 : 10.0
public let kDefaultTopPadding: CGFloat = hasSafeAreaInsets ? 80.0 : 40.0

/// Returns the device's status bar height.
public func statusBarHeight() -> CGFloat {
    let statusBarSize = UIApplication.shared.statusBarFrame.size
    return Swift.min(statusBarSize.width, statusBarSize.height)
}

public var hasSafeAreaInsets: Bool {
    if #available(iOS 11.0, tvOS 11.0, *) {
        return UIApplication.shared.delegate?.window??.safeAreaInsets != .zero
    }
    return false
}
