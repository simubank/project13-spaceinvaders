import Foundation

public struct Transfer : Codable {
    let amount : Double?
    let appID : String?
    let categoryTags : TransferCategoryTags?
    let currency : String?
    let documentType : String?
    let fromAccountID : String?
    let id : String?
    let master : Int32?
    let merchantID : String?
    let receipt : String?
    let toAccountID : String?
    let transactionTime : String?
    let transactionType : String?
}

public struct TransferCategoryTags : Codable {
    
}
