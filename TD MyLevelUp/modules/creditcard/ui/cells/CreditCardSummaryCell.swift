import Foundation
import UIKit

public class CreditCardSummaryCell: TDBaseCell {
    
    lazy var whiteBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.addTdShadow()
        contentView.addSubview(view)
        return view
    }()
    
    lazy var creditCardNameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .textColor
        view.text = "VISA 1223*****2323"
        view.numberOfLines = 0
        view.font = .heavy(withSize: 18)
        self.whiteBackground.addSubview(view)
        return view
    }()
    
    lazy var tdLogo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "td_logo")
        view.contentMode = .scaleAspectFit
        self.whiteBackground.addSubview(view)
        return view
    }()
    
    lazy var balanceLabel: UILabel = {
        let view = UILabel()
        view.textColor = .primary
        view.text = "$1230"
        view.numberOfLines = 0
        view.font = .bold(withSize: 18)
        self.whiteBackground.addSubview(view)
        return view
    }()
    
    lazy var gradient: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "black_gradient")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        self.contentView.addSubview(view)
        return view
    }()
    
    public override func prepareViews() {
        gradient.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        whiteBackground.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding * 2)
            $0.bottom.equalTo(-kDefaultPadding * 2)
            $0.left.equalTo(kDefaultPadding * 2)
            $0.right.equalTo(-kDefaultPadding * 2)
        }
        creditCardNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(-kDefaultPadding * 2)
            $0.left.equalTo(kDefaultPadding)
        }
        tdLogo.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding)
            $0.left.equalTo(kDefaultPadding)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding)
            $0.right.equalTo(-kDefaultPadding)
        }
    }
}
