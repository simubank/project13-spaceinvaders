import Foundation
import Charts

public class CreditHealthCell: TDBaseCell {
    public lazy var chartView: PieChartView = {
        let chartView = PieChartView()
        chartView.legend.enabled = false
        chartView.setExtraOffsets(left: 20, top: 0, right: 20, bottom: 0)
        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
        contentView.addSubview(chartView)
        return chartView
    }()
    
    public override func prepareViews() {
        contentView.clipsToBounds = true
        chartView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(290)
            $0.width.equalTo(290)
        }
    }
    
    func setDataCount(entries: [PieChartDataEntry]) {
        let set = PieChartDataSet(values: entries, label: "Transaction Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = [UIColor.red, UIColor.red.withAlphaComponent(0.8),
        UIColor.red.withAlphaComponent(0.6), UIColor.red.withAlphaComponent(0.4), UIColor.red.withAlphaComponent(0.2), UIColor.orange.withAlphaComponent(0.8),
        UIColor.orange.withAlphaComponent(0.6)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .currency
        pFormatter.maximumFractionDigits = 2
        pFormatter.currencySymbol = "$"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.bold(withSize: 11.0))
        data.setValueTextColor(.black)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
}
