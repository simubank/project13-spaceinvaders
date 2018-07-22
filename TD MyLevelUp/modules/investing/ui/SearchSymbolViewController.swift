import Foundation
import Foundation
import UIKit
import RxSwift

public class SearchSymbolViewController: BaseCollectionViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: SearchViewModel = SearchViewModel(service: YahooService)
    
    public lazy var searchSymbolLabel: UILabel = {
        let label = UILabel()
        label.text = "Search for a Symbol"
        label.textColor = .black
        label.font = .heavy(withSize: 30.0)
        view.addSubview(label)
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        self.view.addSubview(view)
        return view
    }()
    
    public override var customTopHeight: Double {
        return 60
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search Symbol"
        
        searchSymbolLabel.snp.makeConstraints {
            $0.top.equalTo(kDefaultTopPadding + 5)
            $0.left.equalToSuperview().offset(kDefaultPadding)
            $0.right.equalToSuperview().offset(-kDefaultPadding)
        }
        searchBar.snp.makeConstraints {
            $0.top.equalTo(searchSymbolLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        viewModel.results
            .subscribe{ result in
               print(result)
            }.disposed(by: disposeBag)
    }
}
