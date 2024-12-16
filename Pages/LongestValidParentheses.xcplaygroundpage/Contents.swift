//: [Previous](@previous)

import Foundation

class Solution {
    func longestValidParentheses(_ s: String)-> Int {
        var maxLength = 0
        var stack = [Int]()
        stack.append(-1)


        for (index, char) in s.enumerated() {

            if char == "("  || char == "[" {
                stack.append(index)
            }else if char == ")" || char == "]"{
                stack.removeLast()

                if stack.isEmpty {
                    stack.append(index)
                }else {
                    maxLength = max(maxLength, index - stack.last!)

                }
            }
        }

    return maxLength
    }
}


let solution = Solution()
let input = ")()"
let length = solution.longestValidParentheses(input)
print("Longest Valid Parentheses: \(length)")
