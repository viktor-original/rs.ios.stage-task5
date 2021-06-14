import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var resProfit = 0
        for s in 0..<prices.count {
            var buyProfit = 0
            for i in (s+1)..<prices.count {
                if prices[s] < prices[i] {
                    let tempProfit = prices[i] - prices[s]
                    if  tempProfit > buyProfit {
                        buyProfit = tempProfit
                    }
                }
            }
            resProfit += buyProfit
        }
        return resProfit
    }
}
