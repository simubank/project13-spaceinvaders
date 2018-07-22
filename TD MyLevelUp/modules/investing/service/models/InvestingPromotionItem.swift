import Foundation
import UIKit

public class InvestingPromotionItem: NSObject, PromotionItem {
    public let intent: InvestingIntent
    
    public let backgroundImage: UIImage?
    
    public var promotionText: String {
        return intent.messageSnippet
    }
    
    public var buttonText: String? {
        return intent.buttonText
    }
    
    public init(intent: InvestingIntent, image: UIImage?) {
        self.intent = intent
        self.backgroundImage = image
    }
    
    public func controllerDidSelectItem(_ controller: PromotionSectionController, viewController: UIViewController?) {
        intent.openIntent(viewController: viewController)
    }
}
