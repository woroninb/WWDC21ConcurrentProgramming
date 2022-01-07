import UIKit

struct Counter {
    var value = 0
    
    mutating func increment() -> Int {
        value = value + 1
        return value
    }
}

var counter = Counter()
Task.detached {
    print(counter.increment())
}

Task.detached {
    print(counter.increment())
}
