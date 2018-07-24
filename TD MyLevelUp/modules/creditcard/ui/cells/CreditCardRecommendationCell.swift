import Foundation
import UIKit

public class CreditCardRecommendationCell: TDBaseCell {
    public static let preferredHeight: CGFloat = 120.0
    
    public lazy var accountBalanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .standard(withSize: 12.0)
        label.numberOfLines = 0
        label.text = "Based on your transactions, income and credit. We recommend the TD Cash Back Infinite Card."
        contentView.addSubview(label)
        return label
    }()
    
    public lazy var cardImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        view.addTdShadow()
        contentView.addSubview(view)
        return view
    }()
    
    lazy var actionButton: UIButton = {
        let view = UIButton()
        view.setTitle("Learn more", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .primaryLight
        view.titleLabel?.font = .bold(withSize: 12.0)
        view.addTdShadow()
        view.titleEdgeInsets = UIEdgeInsets(top: -kDefaultPadding/2, left: -kDefaultPadding, bottom: -kDefaultPadding/2, right: -kDefaultPadding)
        view.contentEdgeInsets = UIEdgeInsets(top: kDefaultPadding/2, left: kDefaultPadding, bottom: kDefaultPadding/2, right: kDefaultPadding)
        view.layer.cornerRadius = 15
        self.contentView.addSubview(view)
        return view
    }()
    
    public override func prepareViews() {
        accountBalanceLabel.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding)
            $0.left.equalTo(kDefaultPadding)
            $0.right.equalTo(cardImageView.snp.left).offset(-kDefaultPadding)
        }
        actionButton.snp.makeConstraints {
            $0.top.equalTo(accountBalanceLabel.snp.bottom).offset(6)
            $0.centerX.equalTo(accountBalanceLabel.snp.centerX)
            $0.height.equalTo(30)
        }
        
        cardImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(-kDefaultPadding)
            $0.width.equalTo(60 * 1.586)
            $0.height.equalTo(60)
        }
        
        
    }
}
