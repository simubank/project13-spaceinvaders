import Foundation
import Foundation
import UIKit
import RxSwift
import IGListKit

public protocol SearchSymbolDelegate {
    func search(viewcontroller: SearchSymbolViewController, didSelect stock: YahooStock)
    func searchDidCancel(viewcontroller: SearchSymbolViewController)
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
    
    public lazy var closeButton: UIButton = {
        let button = OnClickButton()
        button.setTitle("close", for: .normal)
        button.onClickListener = { _ in
            self.dismiss(animated: true, completion: nil)
            self.delegate?.searchDidCancel(viewcontroller: self)
        }
        view.addSubview(button)
        return button
    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        self.view.addSubview(view)
        return view
    }()
    
    public override var customTopHeight: Double {
        return hasSafeAreaInsets ? 200 : 150
    }
    
    private var searchresults: [ListDiffable] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search Symbol"
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(kDefaultTopPadding - 8)
            $0.right.equalToSuperview().offset(-kDefaultPadding)
        }
        
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
    public override func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return InvestingSimulationEmptyView()
    }
}

public class InvestingSimulationEmptyView: UIView {
    public lazy var suggestionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Suggestions"
        label.textColor = .black
        label.font = .heavy(withSize: 20.0)
        addSubview(label)
        return label
    }()
    
    public lazy var microsoftSuggestion: UIView = {
        let view = SymbolSearchResultCell()
        view.symbolLabel.text = "MSFT"
        view.stockName.text = "Microsoft Corporation"
        addSubview(view)
        return view
    }()
    
    public lazy var netflixSuggestion: UIView = {
        let view = SymbolSearchResultCell()
        view.symbolLabel.text = "NFLX"
        view.stockName.text = "Netflix"
        addSubview(view)
        return view
    }()
    
    public lazy var facebookSuggestion: UIView = {
        let view = SymbolSearchResultCell()
        view.symbolLabel.text = "FB"
        view.stockName.text = "Facebook"
        addSubview(view)
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        suggestionsLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(kDefaultPadding)
            $0.right.equalToSuperview().offset(-kDefaultPadding)
        }
        microsoftSuggestion.snp.makeConstraints {
            $0.top.equalTo(suggestionsLabel.snp.bottom).offset(kDefaultPadding*2)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(0)
        }
        netflixSuggestion.snp.makeConstraints {
            $0.top.equalTo(microsoftSuggestion.snp.bottom).offset(kDefaultPadding*2)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(0)
        }
        facebookSuggestion.snp.makeConstraints {
            $0.top.equalTo(netflixSuggestion.snp.bottom).offset(kDefaultPadding*2)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(0)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
