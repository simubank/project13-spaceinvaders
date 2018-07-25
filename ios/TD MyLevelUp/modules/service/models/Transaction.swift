import Foundation

public struct Transaction : Codable {
    let accountID : String?
    let appID : String?
    let categoryTags : TransactionCategoryTags?
    let currencyAmount : Double
    let customerID : String?
    let description : String?
    let documentType : String?
    let effectiveDate : String?
    let id : String?
    let locationCity : String?
    let locationCountry : String?
    let locationLatitude : Double?
    let locationLongitude : Double?
    let locationPostalCode : String?
    let locationRegion : String?
    let locationStreet : String?
    let master : Int32?
    let merchantCategoryCode : String?
    let merchantID : String?
    let merchantName : String?
    let originalCurrencyAmount : Double?
    let originalCurrency : String?
    let originiationDate : String?
    let postBalance : Double?
    let postDate : String?
    let source : String?
    let type : String?
    
    var date: Date? {
        guard let postDate = postDate else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: postDate)
    }
}

public struct TransactionCategoryTags : Codable {
    
}
