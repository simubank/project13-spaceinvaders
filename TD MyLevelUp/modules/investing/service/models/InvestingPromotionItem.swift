import Foundation
import UIKit

public class InvestingPromotionItem: NSObject, PromotionItem {
    public let backgroundImage: UIImage?
    
    public let promotionText: String
    
    public let buttonText: String?
    
    public init(message: String, image: UIImage?, buttonText: String) {
        self.promotionText = message
        self.backgroundImage = image
        self.buttonText = buttonText
    }
}
