import Foundation
import UIKit

public class StockPurchaseCell: TDBaseCell {
    lazy var symbolLabel: UILabel = {
        let view = UILabel()
        view.font = .heavy(withSize: 14.0)
        view.textColor = .black
        contentView.addSubview(view)
        return view
    }()
    
    lazy var actionLabel: UILabel = {
        let view = UILabel()
        view.font = .standard(withSize: 12.0)
        view.textColor = .black
        contentView.addSubview(view)
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.font = .standard(withSize: 12.0)
        view.textColor = .black
        view.textAlignment = .right
        contentView.addSubview(view)
        return view
    }()
    
    public override func prepareViews() {
        symbolLabel.snp.makeConstraints {
            $0.left.equalTo(kDefaultPadding)
            $0.right.equalTo(dateLabel.snp.left).offset(-kDefaultPadding)
            $0.centerY.equalToSuperview().offset(-10)
        }
        actionLabel.snp.makeConstraints {
            $0.left.equalTo(kDefaultPadding)
            $0.right.equalTo(dateLabel.snp.left).offset(-kDefaultPadding)
            $0.centerY.equalToSuperview().offset(10)
        }
        dateLabel.snp.makeConstraints {
            $0.right.equalTo(-kDefaultPadding)
            $0.centerY.equalToSuperview()
        }
    }
    
    public override func prepareForReuse() {
        symbolLabel.text = ""
        actionLabel.text = ""
        dateLabel.text = ""
    }
}
