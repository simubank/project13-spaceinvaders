import Foundation
import UIKit
import Shimmer

public class DashboardWidgetCell: TDBaseCell {
    lazy var shimmerView: FBShimmeringView = {
        let view = FBShimmeringView()
        view.isShimmering = true
        self.whiteBackground.addSubview(view)
        return view
    }()
    
    lazy var whiteBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .bold(withSize: 14.0)
        view.textColor = .textColor
        whiteBackground.addSubview(view)
        return view
    }()
    
    lazy var widgetIconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "investing_icon_small")
        whiteBackground.addSubview(view)
        return view
    }()
    
    public var widgetContent: UIView? {
        didSet {
            guard let content = widgetContent else { return }
            whiteBackground.addSubview(content)
            content.snp.makeConstraints {
                $0.top.equalTo(40)
                $0.bottom.equalToSuperview()
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
            }
        }
    }
    
    public override func prepareViews() {
        whiteBackground.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(5)
            $0.bottom.equalTo(-5)
            $0.right.equalToSuperview()
        }
//
//        shimmerView.snp.makeConstraints {
//            $0.top.equalTo(40)
//            $0.bottom.equalToSuperview()
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//        }

        widgetIconImageView.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding/2)
            $0.left.equalTo(kDefaultPadding/2)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding/2)
            $0.left.equalTo(widgetIconImageView.snp.right).offset(kDefaultPadding/2)
        }
    }
    
    public override func prepareForReuse() {
        widgetContent?.removeFromSuperview()
    }
}
