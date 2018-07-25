import Foundation
import MBProgressHUD
import Charts

public protocol InvestingSimulationView {
    func simulation(_ presenter: InvestingSimulationPresenter, didUpdate transactions: [Transaction])
    func simulationDidFinishAnalzing(_ presenter: InvestingSimulationPresenter,
                                     trades: [InvestingSimulationTransaction],
                                     historicalData: [CandleChartDataEntry],
                                     summary: InvestingResultSummary)
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
                    let historicalData = response?["Time Series (Daily)"] as? Dictionary<String, Any>,
                    let metaData = response?["Meta Data"] as? Dictionary<String, String>,
                    let lastUpdate = metaData["3. Last Refreshed"] else { return }
                self.analyzeResults(historicalData: historicalData, symbol: symbol, lastUpdated: String(lastUpdate.split(separator: " ")[0]))
            case let .failure(error):
                print(error)
            }
        }
    }
    
    public func analyzeResults(historicalData: Dictionary<String, Any>, symbol: String, lastUpdated: String) {
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
                trades.append(InvestingSimulationTransaction(stockSymbol: symbol,
                                                             expenseName: expense.description,
                                                             amount: sharesToBuy,
                                                             price: price,
                                                             date: expenseDate.alphaVantageDate))
            }
        }
        var stockQuote: [CandleChartDataEntry] = []
        var i = 0
        let dates = historicalData.keys.map { Date.fromAlphaVantage(string: $0) ?? Date() }
        for date in dates.sorted().suffix(30) {
            guard let stockDict = historicalData[date.alphaVantageDate] as? Dictionary<String, Any>, let data = stockDict.jsonData else { continue }
            do {
                let model = try JSONDecoder().decode(StockQuote.self, from: data)
                let high = Double(model.high) ?? 0
                let low = Double(model.low) ?? 0
                let open = Double(model.open) ?? 0
                let close = Double(model.close) ?? 0
                stockQuote.append(CandleChartDataEntry(x: Double(i), shadowH: high, shadowL: low, open: open, close: close))
            } catch {
                print(error)
            }
            i = i + 1
        }
        let totalExpenses: Double = expenses.reduce(0.0) { $0 - $1.currencyAmount }
        print("$\(totalExpenses)")
        print("$\(numberOfShares)")
        if let stockDict = historicalData[lastUpdated] as? Dictionary<String, Any>, let data = stockDict.jsonData {
            do {
                let model = try JSONDecoder().decode(StockQuote.self, from: data)
                let close = Double(model.close) ?? 0
                print("$\(numberOfShares * close)")
                let summary = InvestingResultSummary(totalExpenses: totalExpenses, totalShares: numberOfShares, sharePrice: close, totalInvestment: numberOfShares * close)
                self.view?.simulationDidFinishAnalzing(self,
                                                       trades: trades,
                                                       historicalData: stockQuote,
                                                       summary: summary)
            } catch {
                print(error)
            }
        }
    }
}
