//: [Previous](@previous)

import Foundation

protocol InfixConverter {
    func convert(_ expression: String)-> String
    func precedence(of opt: Character)-> Int
    func isOperator(_ c: Character) -> Bool
}

extension InfixConverter {
    func precedence(of opt: Character)-> Int {
        switch opt {
        case "+", "-" : return 1
        case "*", "/": return 2
        default: return 0
        }
    }

    func isOperator(_ c: Character) -> Bool {
        return c == "+" || c == "-" || c == "*" || c == "/"
    }
}


class InfixToPostfixConverter: InfixConverter {

    func convert(_ expression: String)-> String {
        var outputList = [String]()
        var operatorStack = [Character]()
        let tokens = expression.split(separator: " ")

        print(tokens)

        for token in tokens {
            print("token: \(token)")
            if let operand = token.first , operand.isLetter {

                outputList.append(String(operand))

            }else if token == "(" {
                operatorStack.append("(")
            }else if token == ")" {
                while !operatorStack.isEmpty && operatorStack.last != "(" {
                    outputList.append(String(operatorStack.removeLast()))
                }
                operatorStack.removeLast()
            }else {

                while !operatorStack.isEmpty && precedence(of: operatorStack.last!) >= precedence(of: token.first!) {
                    outputList.append(String(operatorStack.removeLast()))
                }
                operatorStack.append(token.first!)
            }
        }

        while !operatorStack.isEmpty {

            print("Final: \(operatorStack.last!)")
            outputList.append(String(operatorStack.removeLast()))
        }
        return outputList.joined(separator: " ")
    }
}

class InfixToPrefixConvertor: InfixConverter {

    func convert(_ expression: String) -> String {

        var reverserdExpression = swapParanthesis(String(expression.reversed()))
        var operatorStack = [Character]()
        var postFix = ""


        for char in reverserdExpression {
            if char.isLetter {
                postFix.append(char)
            }else if char == "(" {
                operatorStack.append(char)

            }else if char == ")" {
                while let top = operatorStack.last, top != "(" {
                    postFix.append(operatorStack.removeLast())
                }
                operatorStack.removeLast()

            }else if isOperator(char){
                while let top = operatorStack.last, precedence(of: top) >= precedence(of: char) {
                    postFix.append(operatorStack.removeLast())
                }
                operatorStack.append(char)
            }
        }

        while !operatorStack.isEmpty {
            postFix.append(operatorStack.removeLast())
        }

        return String(postFix.reversed())
    }

    private func swapParanthesis(_ input: String)-> String {

        var result = ""

        for char in input {
            if char == "(" {
                result.append(")")
            }else if char == ")" {
                result.append("(")
            }else {
                result.append(char)
            }
        }
        return result
    }
}


let expression = "(A + B)"
let solution:InfixConverter = InfixToPrefixConvertor()
let output = solution.convert(expression)
print(output)
