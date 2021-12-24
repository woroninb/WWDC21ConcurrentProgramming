import UIKit

actor Counter {
    var value: Int = 0
    
    func increment() -> Int {
        value += 1
        return value
    }
}

extension Counter {
    func resetSlowly(to newValue: Int) {
        value = 0
        for _ in 0..<newValue {
            increment()
        }
    }
}
