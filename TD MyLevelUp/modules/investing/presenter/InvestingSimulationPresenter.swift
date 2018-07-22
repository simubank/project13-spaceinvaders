import Foundation
import MBProgressHUD

public protocol InvestingSimulationView {
    func simulation(_ presenter: InvestingSimulationPresenter, didUpdate transactions: [Transaction])
    func simulationDidFinishAnalzing(_ presenter: InvestingSimulationPresenter, trades: [InvestingSimulationTransaction])
}

public class InvestingSimulationPresenter {
    public var view: InvestingSimulationView?
    public var transactions: [Transaction] = []
    
    public func onViewReady() {
        transactions = []
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
                                self.transactions.append(contentsOf: response.result ?? [])
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
                                self.transactions.append(contentsOf: response.result ?? [])
                            case let .failure(error):
                                print(error)
                            }
                            networkCalls.leave()
                        }
                    }
                }
                networkCalls.notify(queue: DispatchQueue.main, execute: {
                    self.view?.simulation(self, didUpdate: self.transactions)
                })
            case let .failure(error):
                print(error)
            }
        }
    }
    
    public func onUpdatedSymbol(_ symbol: String) {
        AlphaVantageService.request(.historicalPrices(symbol: symbol)) { result in
            switch result {
            case let .success(moyaResponse):
                guard let response = try? moyaResponse.mapJSON() as? Dictionary<String, Any>,
                    let historicalData = response?["Time Series (Daily)"] as? Dictionary<String, Any> else { return }
                self.analyzeResults(historicalData: historicalData, symbol: symbol)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    public func analyzeResults(historicalData: Dictionary<String, Any>, symbol: String) {
        var numberOfShares: Double = 0.0
        let expenses = transactions.filter { $0.currencyAmount < 0 }
        var trades: [InvestingSimulationTransaction] = []
        for expense in expenses {
            guard let expenseDate = expense.date else { continue }
            if let quote = historicalData[expenseDate.alphaVantageDate] as? Dictionary<String, String>,
                let quotePrice = quote["4. close"]{
                guard let price = Double(quotePrice) else { continue }
                let sharesToBuy = -expense.currencyAmount / price
                numberOfShares = numberOfShares + sharesToBuy
                trades.append(InvestingSimulationTransaction(stockSymbol: symbol, amount: sharesToBuy, price: price))
            }
        }
        let totalExpenses: Double = expenses.reduce(0.0) { $0 - $1.currencyAmount }
        print("$\(totalExpenses)")
        print("$\(numberOfShares)")
        print("$\(numberOfShares * 361.0500)")
        self.view?.simulationDidFinishAnalzing(self, trades: trades)
    }
}
