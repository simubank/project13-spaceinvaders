import Foundation
import UIKit
import SafariServices

public class InvestingIntent: NSObject, SFSafariViewControllerDelegate {
    public let messageSnippet: String
    public let buttonText: String
    
    public init(message: String, buttonText: String = "Let's Go!") {
        self.messageSnippet = message
        self.buttonText = buttonText
    }
    
    public func openIntent(viewController: UIViewController?) {
        
    }
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

public class InvestingTFSAIntent: InvestingIntent {
    public override func openIntent(viewController: UIViewController?) {
        let controller = SFSafariViewController(url: URL(string: "https://www.td.com/ca/en/personal-banking/products/saving-investing/registered-plans/tfsa/")!)
        controller.delegate = self
        viewController?.present(controller, animated: true, completion: nil)
    }
}

public class InvestingRESPIntent: InvestingIntent {
    public override func openIntent(viewController: UIViewController?) {
        let controller = SFSafariViewController(url: URL(string: "https://www.td.com/ca/en/personal-banking/products/saving-investing/registered-plans/resp/")!)
        controller.delegate = self
        viewController?.present(controller, animated: true, completion: nil)
    }
}

public class InvestingRRSPIntent: InvestingIntent {
    public override func openIntent(viewController: UIViewController?) {
        let controller = SFSafariViewController(url: URL(string: "https://www.td.com/ca/en/personal-banking/products/saving-investing/registered-plans/rsp/")!)
        controller.delegate = self
        viewController?.present(controller, animated: true, completion: nil)
    }
}

public class WhyInvestingIntent: InvestingIntent {
    public override func openIntent(viewController: UIViewController?) {
        viewController?.navigationController?.pushViewController(InvestingSimulationViewController(), animated: true)
    }
}

public class InvestingFinancialPlannerIntent: InvestingIntent {
    public override func openIntent(viewController: UIViewController?) {
        let controller = SFSafariViewController(url: URL(string: "https://www.td.com/ca/products-services/td-wealth/financial-planning.jsp")!)
        controller.delegate = self
        viewController?.present(controller, animated: true, completion: nil)
    }
}
