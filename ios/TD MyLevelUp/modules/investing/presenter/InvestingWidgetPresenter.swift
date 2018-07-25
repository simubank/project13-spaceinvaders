import Foundation

public protocol InvestingWidgetViewContract {
    func updatePromotionalIntents(_ items: [InvestingIntent])
}
public class InvestingWidgetPresenter {
    public var intents: [InvestingIntent]
    
    public var view: InvestingWidgetViewContract? {
        didSet {
            view?.updatePromotionalIntents(intents)
        }
    }
    
    public init() {
        intents = []
        VirtualBankService.request(.accounts(user: AccountManager.shared.id)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = moyaResponse.mapObject(VirtualBankResponse<Accounts>.self) else { return }
                let networkCalls = DispatchGroup()
                if let accounts = response.result?.bankAccounts {
                    for account in accounts {
                        networkCalls.enter()
                        VirtualBankService.request(.transactionsFor(account: account.id ?? "")) { result in
                            switch result {
                            case let .success(moyaResponse):
                                guard let response = moyaResponse.mapObject(VirtualBankResponse<[Transaction]>.self) else { return }
//                                self.intents.append(WhyInvestingIntent(message: "We noticed you are spending quite heavily this month, see how investing instead of spending can grow your wealth"))
                            case let .failure(error):
                                print(error)
                            }
                            networkCalls.leave()
                        }
                    }
                }
                
                if let accounts = response.result?.creditCardAccounts {
                    for account in accounts {
                        networkCalls.enter()
                        VirtualBankService.request(.transactionsFor(account: account.id ?? "")) { result in
                            switch result {
                            case let .success(moyaResponse):
                                guard let response = moyaResponse.mapObject(VirtualBankResponse<[Transaction]>.self) else { return }
                                // TODO
                            //                                self.intents.append(InvestingRESPIntent(message: "It's that time in life... You need to start saving for your child's education. See how an RESP can help you.", buttonText: "I'm interested"))
                            case let .failure(error):
                                print(error)
                            }
                            networkCalls.leave()
                        }
                    }
                }
                
                self.intents.append(WhyInvestingIntent(message: "We noticed you are spending quite heavily this month, see how investing instead of spending can grow your wealth"))
                self.onHandleAccounts(bankAccounts: response.result?.bankAccounts, creditCardAccounts: response.result?.creditCardAccounts)
                networkCalls.notify(queue: DispatchQueue.main, execute: {
                    self.view?.updatePromotionalIntents(self.intents)
                })
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func onHandleAccounts(bankAccounts: [BankAccount]?, creditCardAccounts: [CreditCardAccount]?) {
        var totalBankBalance: Double = 0
        
        intents.append(contentsOf: [                                 InvestingTFSAIntent(message: "New year means an extra $5000 in your TFSA. See how you can benefit from adding $7033 to max your contribution.", buttonText: "I want to invest"),
                                                                     InvestingRRSPIntent(message: "You still have $12350 to contribute to your RRSP!", buttonText: "Find out more"),
                                                                     InvestingRESPIntent(message: "It's that time in life... You need to start saving for your child's education. See how an RESP can help you.", buttonText: "I'm interested")])
        if let accounts = bankAccounts {
            for account in accounts {
                totalBankBalance = totalBankBalance + (account.balance ?? 0)
            }
        }
        
        if let accounts = creditCardAccounts {
            for account in accounts {
                totalBankBalance = totalBankBalance - (account.balance ?? 0)
            }
        }
        
        if totalBankBalance > 100000 {
            intents.append(InvestingFinancialPlannerIntent(message: "It looks like you have more than $100,000, it's time for you to take advantage of our Financial Planners", buttonText: "Learn more"))
        }
    }
}
