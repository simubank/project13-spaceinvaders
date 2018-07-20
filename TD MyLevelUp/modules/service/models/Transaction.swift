import Foundation

public struct Transaction : Codable {
    let accountID : String?
    let appID : String?
    let categoryTags : TransactionCategoryTags?
    let currencyAmount : Double?
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
}

public struct TransactionCategoryTags : Codable {
    
}
