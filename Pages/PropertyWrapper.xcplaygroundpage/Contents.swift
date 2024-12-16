//: [Previous](@previous)

import Foundation

@propertyWrapper
struct ValidatedEmail {
    private var email: String
    private let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"

    var wrappedValue: String {
        get { email }
        set {
            if isValidEmail(newValue) {
                email = newValue
            } else {
                print("Invalid email format")
            }
        }
    }

    init(wrappedValue: String) {
        self.email = wrappedValue
        if !isValidEmail(wrappedValue) {
            print("Invalid email format")
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: pattern)
        let result = regex?.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count))
        return result != nil
    }
}

@propertyWrapper
struct ValidatedPassword{
    private var password: String

    var wrappedValue: String {
        get { password }
        set {
            if isPasswordEmail(newValue) {
                password = newValue
            } else {
                print("Invalid email format")
            }
        }
    }

    init(wrappedValue: String) {
        self.password = wrappedValue
        if !isPasswordEmail(wrappedValue) {
            print("Invalid email format")
        }
    }

    private func isPasswordEmail(_ password: String) -> Bool {

        return password.count >= 3 && password.count <= 5
    }
}


struct UserViewModel {

    @ValidatedEmail private var email: String
    @ValidatedPassword private var password: String


    init(email: String, password: String) {
        self.email = email
        self.password = password
    }

    func haveProvidedValidDetails()-> Bool {
        return !email.isEmpty && !password.isEmpty
    }
}



class ViewController {

    func userLogin() {
        if UserViewModel(email: "shashi.ranjan@jublfood.com", password: "12").haveProvidedValidDetails() {
            print("Valid user data passed")
        }else {
            print("invalid user data passed")
        }
    }
}
