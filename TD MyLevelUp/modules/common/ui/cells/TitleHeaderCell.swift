import Foundation
import UIKit
import SnapKit

class TitleHeaderCell: TDBaseCell {
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .textColor
        view.numberOfLines = 0
        view.font = .bold(withSize: 26)
        self.contentView.addSubview(view)
        return view
    }()
    
    override func prepareViews() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(kDefaultPadding)
            make.trailing.equalToSuperview().offset(-kDefaultPadding)
            make.centerY.equalToSuperview().offset(10)
        }
    }
    
    /// Calculates the proper height depending on the message.
    static func preferredHeight(maxWidth: CGFloat, message: String) -> CGFloat{
        return message.height(withConstrainedWidth: maxWidth, font: .bold(withSize: 26)) + kDefaultPadding
    }
}
