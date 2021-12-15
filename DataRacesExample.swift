import UIKit

class Counter {
    var value = 0
    
    func inctement() -> Int {
        value = value + 1
        return value
    }
}


let counter = Counter()

Task.detached {
    print(counter.inctement())
}

Task.detached {
    print(counter.inctement())
}
