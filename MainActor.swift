import UIKit

var greeting = "Hello, playground"

@MainActor func checkOut(_ booksOnLoan: [Book]) {
    booksView.checkedOutBooks = booksOnLoan
}

await checkedOut(booksOnLoan)
