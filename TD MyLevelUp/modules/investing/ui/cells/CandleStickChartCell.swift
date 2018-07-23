import Foundation
import Charts
import UIKit

class CandleStickChartCell: TDBaseCell {
    public var chartView: CandleStickChartView = {
        let chartView = CandleStickChartView()
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = false
        chartView.setScaleEnabled(true)
        chartView.maxVisibleCount = 200
        chartView.pinchZoomEnabled = true
        chartView.legend.enabled = false
        chartView.legend.font = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.leftAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.leftAxis.spaceTop = 0.3
        chartView.leftAxis.spaceBottom = 0.3
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.rightAxis.enabled = false
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.xAxis.drawGridLinesEnabled = false
        return chartView
    }()
    
    public override func prepareViews() {
        contentView.addSubview(chartView)
        chartView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(kDefaultPadding)
            $0.left.equalToSuperview().offset(kDefaultPadding)
            $0.right.equalToSuperview().offset(-kDefaultPadding)
            $0.bottom.equalToSuperview().offset(-kDefaultPadding)
        }
    }
    
    func setData(stockName: String, data: [CandleChartDataEntry]?) {
        let set1 = CandleChartDataSet(values: data, label: "\(stockName.uppercased()) Stock")
        set1.axisDependency = .left
        set1.setColor(UIColor(white: 80/255, alpha: 1))
        set1.drawIconsEnabled = false
        set1.shadowColor = .darkGray
        set1.shadowWidth = 0.7
        set1.decreasingColor = .red
        set1.decreasingFilled = true
        set1.increasingColor = .primary
        set1.increasingFilled = true
        set1.neutralColor = .blue
        set1.drawValuesEnabled = false
        let data = CandleChartData(dataSet: set1)
        chartView.data = data
    }}
