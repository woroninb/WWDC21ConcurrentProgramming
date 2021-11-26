# Meet async/await in swift

[https://developer.apple.com/videos/play/wwdc2021/10132/]()

## Async Await

### Before iOS 15 
Example of async function with callbacks (common pattern before iOS 15) ([Snippet](https://github.com/woroninb/WWDC21ConcurrentProgramming/blob/main/OldStyleNetworking.swift))

Drawback of this function:

* Many paths for error tracking and without using their callback function we will not cover properly those cases on the UI level. For example we will not hide spinner.
* We ended with long function with many paths to support in this case: 5

### New approach with await/async

* Much more simpler in terms of complexity: Just 6 lines of code
* easier error handling
* Snippet: 
[await/async for netwoking](https://github.com/woroninb/WWDC21ConcurrentProgramming/blob/main/asyncFunction.swift)

Async can be used in: 

* [functions](https://github.com/woroninb/WWDC21ConcurrentProgramming/blob/main/asyncFunction.swift)
* [read only properties](https://github.com/woroninb/WWDC21ConcurrentProgramming/blob/main/AsyncProperty.swift)
* [for loops](https://www.hackingwithswift.com/quick-start/concurrency/how-to-loop-over-an-asyncsequence-using-for-await)


Summary about async

* it gives control of the thread to the system
* So once the function suspends itself, the system is free to use the thread to do other work
* When function is suspended it also suspends its callers too. So its callers must be async as well.


## Task

### What is task?

* Is a bridge between sync and async context. For example we need it inside onAppear block to run async function
* main benefit here is that async code can be called from inside of sync contexts.


Tip: Omit get in async function name


## Continutaion

About continutaion

-  methods that take completion blocks
-  helps rewrite the callbacks to async/await manner

Please take a look on example

withCheckedThrowingContinuation
withCheckedContinuation

To move from completion handler async code to async/await style we need to:

- We return all the time value from the signature of the function
- func funcName async
- Use await for async function in the function body


## Delagates with the usage of async


#


# resources

https://www.biteinteractive.com/swift-5-5-asynchronous-looping-with-async-await/



