import UIKit

struct Author {
    let id: UUID
    let name: String
}

struct Book {
    let id: String
    let authors: [Author]
}

actor LibraryAccount {
    let idNumber: Int = 0
    var booksOnLoan: [Book] = []
    func selectRandomBook() -> Book? {
        return nil
    }
}

func visit(_ account: LibraryAccount) async {
    guard var book = await account.selectRandomBook() else {
        return
    }
}
