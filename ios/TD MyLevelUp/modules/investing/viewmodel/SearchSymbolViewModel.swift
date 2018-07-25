import Foundation
import RxSwift
import Moya
import RxCocoa
import IGListKit

public enum SearchMode {
    case tags
    case boards
}

public protocol SearchSymbolViewModelInputs {
    /// Updates the search text
    var searchText: PublishSubject<String> { get }
    
    /// Updates selected board
    var selectStock: PublishSubject<YahooStock> { get }
}

public protocol SearchSymbolViewModelOutputs {
    /// The results from search
    var results: Observable<[ListDiffable]> { get }
}

public class SearchViewModel: SearchSymbolViewModelInputs, SearchSymbolViewModelOutputs {
    // MARK: Inputs
    public var searchText: PublishSubject<String> = PublishSubject<String>()
    public var selectStock: PublishSubject<YahooStock> = PublishSubject<YahooStock>()
    
    // MARK: Outputs
    public var results: Observable<[ListDiffable]> = Observable<[ListDiffable]>.empty()
    
    // MARK: Public Variables
    public let disposeBag = DisposeBag()
    
    private let service: MoyaProvider<YahooAPI>
    public init(service: MoyaProvider<YahooAPI>) {
        self.service = service
        
        results = searchText
            .throttle(0.8, scheduler: MainScheduler.instance)
            .flatMap({
                self.service.rx.request(.search(symbol: $0)).map(YahooSearchSymbolRs.self)
            })
            .flatMapLatest({ response -> Observable<[ListDiffable]> in
                return Observable.just(response.payload.result)
            })
    }
}
