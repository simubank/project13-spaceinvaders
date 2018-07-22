//
//  Account.swift
//  VirtualBank
//
//  Created by Omas Abdullah on 2018-05-14.
//  Copyright © 2018 TD Lab. All rights reserved.
//

import Foundation

public struct AccountType : Codable {
    let bankAccount: BankAccount?
    let creditCardAccount: CreditCardAccount?
}

public struct Accounts : Codable {
    let bankAccounts: [BankAccount]?
    let creditCardAccounts: [CreditCardAccount]?
}

public protocol Account : Codable {
    var type : String? { get }
    var openDate : String? { get } // date and time account was opened
    var id : String? { get } // unique identifier (GUID)
    var balance : Double? { get } // account balance
    var currency : String? { get } // currency of the balance
    var number : String? { get } // just for self account
}

open class BankAccount : Codable, Account {
    public var type : String?
    public var openDate : String? // date and time account was opened
    public var id : String? // unique identifier (GUID)
    public var balance : Double? // account balance
    public var currency : String? // currency of the balance
    public var number : String? // just for self account
    public var branchNumber: String?
    public var maskedAccountNumber: String?
    public var iban : String? // international bank account number
    public var relatedCustomers: BankRelatedCustomers?
}

open class CreditCardAccount : Codable, Account {
    public var type : String?
    public var openDate : String? // date and time account was opened
    public var id : String? // unique identifier (GUID)
    public var balance : Double? // account balance
    public var currency : String? // currency of the balance
    public var number : String? // just for self account
    public var relatedCustomers: CreditRelatedCustomers?
    public var maskedNumber: String?
    public var cards: [Card]?
}

public struct Card : Codable {
    let id: String?
    let securityCode: String?
    let maskedNumber: String?
    let customerId: String?
    let accountId: String?
    let nameOnCard: String?
}

public struct BankRelatedCustomers : Codable {
    let individual : [Individual]?
}

public struct CreditRelatedCustomers : Codable {
    let authorized : [Individual]?
}

public struct  Individual : Codable {
    let customerID : String? // customer ID (GUID)
    let type : String? // customer type
}
