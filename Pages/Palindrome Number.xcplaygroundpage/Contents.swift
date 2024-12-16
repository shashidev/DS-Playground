//Given an integer x, return true if x is a palindrome and false otherwise.

/*
 Example 1:
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.

 */

/*
 Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 */


import Foundation


func palindrome(x: Int)-> Bool {

    var number = x
    var reversedNumber = 0

    while number > 0 {
        let reminder = number % 10
        reversedNumber = reversedNumber * 10 + reminder
        number = number / 10
    }

    return reversedNumber == x

}


let result = palindrome(x: 121)
print(result)
