import UIKit

actor Counter {
    var value = 0
    
    func increment() -> Int {
        value = value + 1
        return value
    }
}

let counter = Counter()
Task.detached {
    print(await counter.increment())
}

Task.detached {
    print(await counter.increment())
}
