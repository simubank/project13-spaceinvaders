import Foundation
import UIKit
import SnapKit

class PromotionCell: TDBaseCell {
    lazy var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.alpha = 0.45
        self.contentView.addSubview(view)
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
    
    lazy var actionButton: UIButton = {
        let view = UIButton()
        view.setTitle("Let's Go", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .primaryLight
        view.titleLabel?.font = .bold(withSize: 14.0)
        view.addTdShadow()
        view.titleEdgeInsets = UIEdgeInsets(top: -kDefaultPadding/2, left: -kDefaultPadding, bottom: -kDefaultPadding/2, right: -kDefaultPadding)
        view.contentEdgeInsets = UIEdgeInsets(top: kDefaultPadding/2, left: kDefaultPadding, bottom: kDefaultPadding/2, right: kDefaultPadding)
        view.layer.cornerRadius = 18
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var promotionLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .heavy(withSize: 22.0)
        view.text = "Hey Rishi! We noticed you can benefit from XYZ Investment Product."
        view.numberOfLines = 0
        view.textAlignment = .center
        self.contentView.addSubview(view)
        return view
    }()
    
    override func prepareViews() {
        contentView.backgroundColor = .black
        backgroundImage.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        gradient.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        promotionLabel.snp.makeConstraints {
            $0.leading.equalTo(kDefaultPadding)
            $0.trailing.equalTo(-kDefaultPadding)
            $0.top.equalTo(kDefaultPadding)
            $0.bottom.equalTo(actionButton.snp.top).offset(-kDefaultPadding)
        }
        actionButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(36)
            $0.bottom.equalTo(-30)
        }
    }
}
