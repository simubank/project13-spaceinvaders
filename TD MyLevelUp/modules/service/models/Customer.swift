//
//  Customer.swift
//  VirtualBank
//
//  Created by Omas Abdullah on 2018-05-15.
//  Copyright © 2018 TD Lab. All rights reserved.
//

import Foundation

public struct Customer: Codable {
    let addresses : Addresses?
    let age : Int32? // customer age
    let birthDate : String? // customer date of birth
    let gender : String? //customer gender
    let givenName : String? // customer first name
    let habitationStatus : String? // customer living / residence status
    let id : String? // unique identifier (GUID)
    let otherName : String? // additional / preferred customer name
    let primaryOccupation : String? // customer primary occupation
    let maskedRelatedBankAccounts : MaskedRelatedBankAccounts?
    let relatedBankAccounts : CustomerRelatedBankAccounts?
    let relationshipStatus : String?
    let schools : Schools?
    let surname : String?
    let type: String?
    
    var fullName: String {
        return "\(givenName ?? "") \(surname ?? "")"
    }
}

public struct Schools : Codable {
    
}

public struct Addresses : Codable {
    let principalResidence: Address?
}

public struct PrincipalResidence : Codable {
    let municipality: String?
    let postalCode: String?
    let streetName: String?
    let latitude: Double?
    let longitude: Double?
    let streetNumber: String?
}

public struct Address : Codable { //correct
    let addressType : Int?
    let latitude : Double?
    let longitude : Double?
    let municipality : String?
    let postalCode : String?
    let streetName : String?
    let streetNumber : String?
    let wardName : String?
}


public struct CustomerRelatedBankAccounts: Codable {
    let individual: [CustomerBankAccount]?
}

public struct MaskedRelatedBankAccounts: Codable {
    let individual: [MaskedBankAccount]?
}

public struct CustomerBankAccount: Codable {
    let branchNumber: String?
    let accountNumber: String?
    let accountID: String?
}

public struct MaskedBankAccount: Codable {
    let branchNumber: String?
    let maskedAccountNumber: String?
    let accountID: String?
}
