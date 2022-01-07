import Foundation

struct Book {
    let title: String
}

actor LibraryAccount {
    let idNumber: Int = 0
    var booksOnLoan: [Book] = []
}

extension LibraryAccount: Equatable {
    static func == (lhs: LibraryAccount, rhs: LibraryAccount) -> Bool {
        return lhs.idNumber == rhs.idNumber
    }
}

extension LibraryAccount: Hashable {
     func hash(into hasher: inout Hasher) {
        hasher.combine(idNumber)
    }
}

