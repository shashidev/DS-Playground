//: [Previous](@previous)

import Foundation


protocol Balancing {
    func isBalanced(_ expression: String)-> Bool
}




class Bracket: Balancing  {
    func isBalanced(_ expression: String)-> Bool {
        let matchingBrackets:[Character: Character] = ["(": ")", "[": "]", "{": "}"]
        var stack = [Character]()

        for char in expression {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            }
            else  if char == ")" || char == "]" || char == "}"{
                if stack.isEmpty || matchingBrackets[stack.removeLast()] != char {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}


//<div>Hell0</>
class HTMLTagBalancing: Balancing {

    func isBalanced(_ expression: String) -> Bool {
        // Initialize an empty stack to keep track of opening tags
        var stack = [String]()
        // Initialize the index to iterate through the expression
        var idx = 0

        // Loop through each character in the expression
        while idx < expression.count {
            // Get the current character index
            let startIndex = expression.index(expression.startIndex, offsetBy: idx)

            // Check if the current character is the start of a tag
            if expression[startIndex] == "<" {
                // Find the closing '>' for the tag
                let endTagIndex = expression.range(of: ">", range: startIndex..<expression.endIndex)

                // If a closing '>' is found
                if let endRange = endTagIndex {
                    // Extract the complete tag from the expression
                    let tag = String(expression[startIndex..<endRange.upperBound])
                    // Check if it's a closing tag (e.g., "</tag>")
                    let isClosingTag = tag.hasPrefix("</")

                    if isClosingTag {
                        // Extract the name of the closing tag
                        let closingTagName = String(tag.dropFirst(2).dropLast())

                        // Check if the stack is empty or the last opened tag doesn't match the closing tag
                        if stack.isEmpty || stack.last != closingTagName {
                            return false // Return false if there's a mismatch
                        }
                        // If it matches, pop the last opened tag from the stack
                        stack.removeLast()
                    } else {
                        // It's an opening tag (e.g., "<tag>")
                        let openingTagName = String(tag.dropFirst().dropLast())
                        // Push the opening tag onto the stack
                        stack.append(openingTagName)
                    }
                    // Move the index to the character after the closing '>'
                    idx = expression.distance(from: expression.startIndex, to: endRange.upperBound)
                }
            } else {
                // If it's not a tag, move to the next character
                idx += 1
            }
        }

        // At the end, check if the stack is empty. If yes, tags are balanced.
        return stack.isEmpty
    }

}


let solution: Balancing = HTMLTagBalancing()

let exp = "<div><p></p></div>"
let result = solution.isBalanced(exp)
print("Is HTML Balances? \(result)")

//let solution:Balancing = Bracket()
//
//let input1 = "()[]{}"
//let input2 = "([{}])"
//let input3 = "(]"
//let input4 = "({[})"
//solution.isBalanced(input1)
//
//print(solution.isBalanced(input1))
//print(solution.isBalanced(input2))
//print(solution.isBalanced(input3))
//print(solution.isBalanced(input4))
