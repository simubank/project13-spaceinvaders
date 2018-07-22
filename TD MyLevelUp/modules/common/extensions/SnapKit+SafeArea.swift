import Foundation
import SnapKit

public extension ConstraintMakerRelatable {
    @discardableResult
    public func equalToSafeAreaTop(_ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top
            return self.equalToSuperview().offset(topPadding ?? 5)
        } else {
            return self.equalToSuperview()
        }
    }
}
