import Foundation
import UIKit
import SnapKit

class SeeMoreCell: TDBaseCell {
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .textColor
        view.numberOfLines = 0
        view.textAlignment = .center
        view.text = "See more"
        view.font = .standard(withSize: 14.0)
        self.contentView.addSubview(view)
        return view
    }()
    
    override func prepareViews() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(kDefaultPadding)
            make.trailing.equalToSuperview().offset(-kDefaultPadding)
            make.centerY.equalToSuperview()
        }
    }
}
