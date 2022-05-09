/*:
 [Previous](@previous)
 
 [Каким образом захватывается переменная если **closure**](EscapingValueType)

 # Каким образом захватывается переменная если **closure**:
 # `noescape`, переменная **value type**

 В случае с **value  type**, при захвате ссылки на `self` в **noescape closure**, захват происходит неявно, и никаких
 проблем с **mutable** `self` не возникает, поскольку **closure** отрабатывает сразу и нигде не сохраняется.
 */
func testNoescape(closure: () -> ()) {
    closure()
}

struct TestValueType {
    var someValue = 1

    func firstTestFunc() {
        testNoescape {
            // self захватывается неявно
            print(someValue)
        }
    }

    mutating func secondTestFunc() {
        testNoescape {
            // self захватывается неявно, нет проблем с mutable self
            someValue += 10
            print(someValue)
        }
    }
}
//: [Next](@next)
