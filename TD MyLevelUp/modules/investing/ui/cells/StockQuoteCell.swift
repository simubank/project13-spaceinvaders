import Foundation
import UIKit

public class StockQuoteCell: TDBaseCell {
    public lazy var whiteBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addTdShadow()
        contentView.addSubview(view)
        return view
    }()
    
    public lazy var percentGainLabel: UILabel = {
        let view = UILabel()
        view.font = .bold
        view.text = "500%"
        view.textAlignment = .center
        view.textColor = .primaryLight
        contentView.addSubview(view)
        return view
    }()
    
    public lazy var stockTickerLabel: UILabel = {
        let view = UILabel()
        view.font = .standard(withSize: 14.0)
        view.text = "MSFT"
        view.textAlignment = .center
        contentView.addSubview(view)
        return view
    }()
    
    public override func prepareViews() {
        whiteBackground.snp.makeConstraints {
            $0.top.equalTo(8)
            $0.bottom.equalTo(8)
            $0.left.equalTo(8)
            $0.right.equalTo(8)
        }
        percentGainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-6)
        }
        stockTickerLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(percentGainLabel.snp.bottom)
        }
    }
}
