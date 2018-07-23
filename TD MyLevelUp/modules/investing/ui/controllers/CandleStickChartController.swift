import Foundation
import IGListKit
import Charts

public class CandleStickChartModel: NSObject {
    public let data: [CandleChartDataEntry]
    public let stockName: String
    public init(stockName: String, data: [CandleChartDataEntry]) {
        self.stockName = stockName
        self.data = data
    }
}

public class CandleStickChartController: ListSectionController {
    
    public var model: CandleStickChartModel?
    
    public override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CandleStickChartCell.self, for: self, at: index) as? CandleStickChartCell else {
            fatalError()
        }
        cell.setData(stockName: model?.stockName ?? "", data: model?.data)
        return cell
    }
    
    public override func didUpdate(to object: Any) {
        model = object as? CandleStickChartModel
    }
    
    public override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return CGSize.zero}
        return CGSize(width: collectionContext.containerSize.width, height: 150)
    }
}
