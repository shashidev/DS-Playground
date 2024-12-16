//: [Previous](@previous)

import Foundation

/// A protocol that represents a type for cell models.
protocol CellModelType {}

/// A struct that represents a null or default cell model.
/// Used when no specific data needs to be passed to a cell.
struct NullCellModel: CellModelType {}

/// A struct that represents a cell model for a user.
struct UserCellwModel: CellModelType {
    var name: String?
    var Phone: String?
}

/// A struct that represents a cell model for an address.
struct AddressCellModel: CellModelType {
    var faltNo: String?
    var street: String?
}

/// A protocol that defines a method for creating cell models.
/// the `createViewModel` method can have params based on your requirement. For demonstration purposes I have kept it non-parametrised
protocol CellModelCreator {
    func create() -> CellModelType
}

/// A class that creates and returns a `NullCellModel`.
/// Used when no specific cell model is required.
class NullCellViewModelCreator: CellModelCreator {
    func create() -> CellModelType {
        return NullCellModel()
    }
}

/// A class that creates and returns a `UserCellwModel` with user data.
class UserCellViewModelCreator: CellModelCreator {
    func create() -> CellModelType {
        return UserCellwModel(name: "Shashi", Phone: "8237291769")
    }
}

/// A class that creates and returns an `AddressCellModel` with address data.
class AddressCellViewModelCreator: CellModelCreator {
    func create() -> CellModelType {
        return AddressCellModel(faltNo: "5/7", street: "Shipra Sun City")
    }
}

/// A factory class responsible for creating instances of `CellModelCreator` based on a cell identifier.
/// This factory returns the appropriate `CellModelCreator` instance for the given cell identifier.
class CellModelCreatorFactory {
    /// Returns a specific `CellModelCreator` instance based on the provided cell identifier.
    /// - Parameter cellIdentifier: The identifier for the cell (e.g., "UserCell", "AddressCell").
    /// - Returns: An instance of `CellModelCreator` corresponding to the cell identifier.
    static func geCellModelCreator(for cellIdentifier: String) -> CellModelCreator {
        switch cellIdentifier {
        case "UserCell":
            return UserCellViewModelCreator()
        case "AddressCell":
            return AddressCellViewModelCreator()
        default:
            return NullCellViewModelCreator()
        }
    }
}




// Example usage in a method where you need to create a cell model:
let cellIdentifier = "UserCell" // This could be dynamic
let cellModelCreator = CellModelCreatorFactory.geCellModelCreator(for: cellIdentifier)
let cellModel = cellModelCreator.create()

// Use the `cellModel` to configure your cell
if let userCellModel = cellModel as? UserCellwModel {
    print("UserName: \(userCellModel.name ?? "") and Phone: \(userCellModel.Phone ?? "")")
} else if let addressCellModel = cellModel as? AddressCellModel {
    print("Flat No: \(addressCellModel.faltNo ?? "") and Street: \(addressCellModel.street ?? "")")
} else {
    // Handle null or unknown model types
}


