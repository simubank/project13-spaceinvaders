import Foundation
import UIKit

public class SymbolSearchResultCell: TDBaseCell {
    lazy var symbolLabel: UILabel = {
        let view = UILabel()
        view.font = .heavy(withSize: 14.0)
        view.textColor = .black
        contentView.addSubview(view)
        return view
    }()
    
    lazy var stockName: UILabel = {
        let view = UILabel()
        view.font = .standard(withSize: 12.0)
        view.textColor = .black
        contentView.addSubview(view)
        return view
    }()
    
    lazy var stockTypeLabel: UILabel = {
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
            $0.right.equalTo(stockTypeLabel.snp.left).offset(-kDefaultPadding)
            $0.centerY.equalToSuperview().offset(-10)
        }
        stockName.snp.makeConstraints {
            $0.left.equalTo(kDefaultPadding)
            $0.right.equalTo(stockTypeLabel.snp.left).offset(-kDefaultPadding)
            $0.centerY.equalToSuperview().offset(10)
        }
        stockTypeLabel.snp.makeConstraints {
            $0.right.equalTo(-kDefaultPadding)
            $0.centerY.equalToSuperview()
        }
    }
}
