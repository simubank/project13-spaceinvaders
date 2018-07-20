import Foundation

public class InvestingIntent {
    public let messageSnippet: String
    public let buttonText: String
    public init(message: String, buttonText: String = "Let's Go!") {
        self.messageSnippet = message
        self.buttonText = buttonText
    }
}

public class InvestingTFSAIntent: InvestingIntent {
    
}
