//: [Previous](@previous)

import Foundation

//Given a string s, find the length of the longest substring without repeating characters.



/*Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.

 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.

 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

class Solution {

    func lengthOfLongestSubstring(_ s: String)-> Int {

        var charDict = [Character: Int]()

        var result = 0

        var startIndex = 0

        for (index, char) in s.enumerated() {

            if let lastIndex = charDict[char], lastIndex >= startIndex {
                startIndex = lastIndex + 1
            }

            charDict[char] = index

            result = max(result, index - startIndex + 1)
        }
        return result
    }
}

let solustion = Solution()

let length = solustion.lengthOfLongestSubstring("cccc")
print(length)
