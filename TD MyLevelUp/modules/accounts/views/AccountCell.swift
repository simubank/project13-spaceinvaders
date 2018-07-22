import UIKit
import SnapKit

class AccountCell: UITableViewCell {
    
    let type = UILabel()
    let balance = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.addSubview(type)
        type.font = .standard(withSize: 18.0)
        type.snp.makeConstraints {
            $0.top.equalTo(5)
            $0.left.equalTo(10)
        }
        
        contentView.addSubview(balance)
        balance.font = .medium(withSize: 40.0)
        balance.snp.makeConstraints {
            $0.top.equalTo(type).offset(30)
            $0.left.equalTo(type)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
