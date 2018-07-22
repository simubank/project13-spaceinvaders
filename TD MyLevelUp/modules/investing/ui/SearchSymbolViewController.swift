import Foundation
import Foundation
import UIKit
import RxSwift
import IGListKit

public protocol SearchSymbolDelegate {
    func search(viewcontroller: SearchSymbolViewController, didSelect stock: YahooStock)
}

public class SearchSymbolViewController: BaseCollectionViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: SearchViewModel = SearchViewModel(service: YahooService)
    
    var delegate: SearchSymbolDelegate?
    
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
        return 200
    }
    
    private var searchresults: [ListDiffable] = []
    
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
               self.searchresults = result.element ?? []
                self.adapter.performUpdates(animated: true, completion: nil)
            }.disposed(by: disposeBag)
    }
    
    public override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return searchresults
    }
    public override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return SymbolSearchResultController()
    }
}
