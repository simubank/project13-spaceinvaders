import Foundation

public protocol InvestingWidgetViewContract {
    func updatePromotionalIntents(_ items: [InvestingIntent])
}
public class InvestingWidgetPresenter {
    public let intents: [InvestingIntent] = [InvestingTFSAIntent(message: "We noticed you are spending quite heavily this month, see how investing instead of spending can grow your wealth"),
                          InvestingTFSAIntent(message: "It looks like you have more than $100,000, it's time for you to take advantage of our Financial Planners", buttonText: "Learn more"),
                          InvestingTFSAIntent(message: "New year means an extra $5000 in your TFSA. See how you can benefit from adding $7033 to max your contribution.", buttonText: "I want to invest"),
                          InvestingTFSAIntent(message: "You still have $12350 to contribute to your RRSP!", buttonText: "Find out more"),
                          InvestingTFSAIntent(message: "It's that time in life... You need to start saving for your child's education. See how an RESP can help you.", buttonText: "I'm interested")]
    
    public var view: InvestingWidgetViewContract? {
        didSet {
            view?.updatePromotionalIntents(intents)
        }
    }
    
    public init() {
        
    }
}
