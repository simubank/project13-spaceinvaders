import Foundation
import UIKit

public class TransactionCell: TDBaseCell {
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = .heavy(withSize: 14.0)
        view.textColor = .black
        contentView.addSubview(view)
        return view
    }()
    lazy var balanceLabel: UILabel = {
        let view = UILabel()
        view.font = .standard(withSize: 12.0)
        view.textColor = .black
        view.textAlignment = .right
        contentView.addSubview(view)
        return view
    }()
    
    public override func prepareViews() {
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(kDefaultPadding)
            $0.right.equalTo(balanceLabel.snp.left).offset(-kDefaultPadding)
            $0.centerY.equalToSuperview()
        }
        
        balanceLabel.snp.makeConstraints {
            $0.right.equalTo(-kDefaultPadding)
            $0.centerY.equalToSuperview()
        }
    }
    
    public override func prepareForReuse() {
        nameLabel.text = ""
        balanceLabel.text = ""
    }
}
