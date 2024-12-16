//: [Previous](@previous)

import Foundation



class Solution {

    // Problem 1: Maximum Profit from Stock Prices
    // Description: Given an array of stock prices where the index represents the day, find the maximum profit you can achieve by buying and selling the stock once.
    //Input: prices = [7, 1, 5, 3, 6, 4]
    //Output: 5 // Buy on day 2 (price = 1) and sell on day 5 (price = 6)

    func maxProfite(_ prices:[Int])-> Int {
        var maxprofit = 0
        var minPrice = Int.max

        for price in prices {

            if price <  minPrice {
                minPrice = price
            }else {

                let profit = price - minPrice

                if profit > maxprofit {

                    maxprofit = profit
                }
            }
        }

        return maxprofit
    }

    func maxProfitMultipleTransactions(_ prices: [Int])-> Int {

        var maxProfit = 0

        for i in 1..<prices.count {

            if prices[i] > prices[i - 1] {

                maxProfit += prices[i] - prices[i - 1]
            }

        }

        return maxProfit
    }
}

let solution = Solution()

let prices = [7, 1, 5, 3, 6, 4]
print(solution.maxProfitMultipleTransactions(prices))

