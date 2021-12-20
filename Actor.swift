import UIKit

actor Counter {
    var value: Int = 0
    
    func increment() -> Int {
        value += 1
        return value
    }
}

let counter = Counter()

Task.detached {
    await counter.increment()
}

Task.detached {
    await counter.increment()
}
