import Foundation
import UIKit
import EFCountingLabel

public class InvestingResultsCell: TDBaseCell {
    lazy var totalExpensesLabel: UILabel = {
        let view = UILabel()
        view.textColor = .textColor
        view.text = "Total Expenses: "
        view.numberOfLines = 0
        view.font = .heavy(withSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var potentialEarningsLabel: UILabel = {
        let view = UILabel()
        view.textColor = .textColor
        view.text = "Value after investing: "
        view.numberOfLines = 0
        view.font = .heavy(withSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var growthLabel: UILabel = {
        let view = UILabel()
        view.textColor = .textColor
        view.text = "Total Growth: "
        view.numberOfLines = 0
        view.font = .heavy(withSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var totalExpensesValue: EFCountingLabel = {
        let view = EFCountingLabel()
        view.textColor = .red
        view.numberOfLines = 0
        view.format = "$%.2f"
        view.font = .bold(withSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var potentialEarningsValue: EFCountingLabel = {
        let view = EFCountingLabel()
        view.textColor = .primary
        view.numberOfLines = 0
        view.format = "$%.2f"
        view.font = .bold(withSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    lazy var growthValue: EFCountingLabel = {
        let view = EFCountingLabel()
        view.textColor = .primary
        view.format = "$%.2f"
        view.numberOfLines = 0
        view.font = .bold(withSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    public override func prepareViews() {
        totalExpensesLabel.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding)
            $0.left.equalTo(kDefaultPadding)
        }
        potentialEarningsLabel.snp.makeConstraints {
            $0.top.equalTo(totalExpensesLabel.snp.bottom).offset(10)
            $0.left.equalTo(kDefaultPadding)
        }
        growthLabel.snp.makeConstraints {
            $0.top.equalTo(potentialEarningsLabel.snp.bottom).offset(10)
            $0.left.equalTo(kDefaultPadding)
        }
        totalExpensesValue.snp.makeConstraints {
            $0.top.equalTo(kDefaultPadding)
            $0.right.equalTo(-kDefaultPadding)
        }
        potentialEarningsValue.snp.makeConstraints {
            $0.top.equalTo(totalExpensesValue.snp.bottom).offset(10)
            $0.right.equalTo(-kDefaultPadding)
        }
        growthValue.snp.makeConstraints {
            $0.top.equalTo(potentialEarningsValue.snp.bottom).offset(10)
            $0.right.equalTo(-kDefaultPadding)
        }
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        totalExpensesValue.text = "$0.00"
        potentialEarningsValue.text = "$0.00"
        growthValue.text = "$0.00"
    }
}
