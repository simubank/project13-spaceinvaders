import Foundation
import UIKit
import EFCountingLabel

public class BankAccountCell: TDBaseCell {
    lazy var whiteBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.addTdShadow()
        contentView.addSubview(view)
        return view
    }()
    
    public lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = .heavy(withSize: 16.0)
        label.textColor = .black
        whiteBackground.addSubview(label)
        return label
    }()
    
    public lazy var accountsBalanceLabel: EFCountingLabel = {
        let label = EFCountingLabel()
        label.format = "$%.2f"
        label.text = "$0.0"
        label.font = .medium(withSize: 14.0)
        label.textColor = .primary
        whiteBackground.addSubview(label)
        return label
    }()
    
    public lazy var cardImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        view.image = UIImage(named: "debit_card_image")
        whiteBackground.addSubview(view)
        return view
    }()
    
    
    public override func prepareViews() {
        whiteBackground.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding/2)
            $0.bottom.equalTo(-kDefaultPadding/2)
            $0.left.equalTo(kDefaultPadding/2)
            $0.right.equalTo(-kDefaultPadding/2)
        }
        
        cardImageView.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding/2)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50.2)
            $0.width.equalTo(80)
        }
        
        accountNameLabel.snp.makeConstraints {
            $0.top.equalTo(cardImageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        accountsBalanceLabel.snp.makeConstraints {
            $0.top.equalTo(accountNameLabel.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
}
