/*:
 [Previous](@previous)
 
 [**Closure** `Escaping`](ClosureEscaping)

 # Каким образом захватывается переменная если **closure**:
 # `escaping`, переменная **value type**

 В случае с **value type**, при захвате ссылки на `self` в `escaping` **closure**, захват происходит неявно, но стоит
 отметить, что `escaping` **closure** не могут захватывать **mutable** ссылки на `self`, если `self` является
 **value type**.
 */
var escapingClosure: (() -> ())? = nil

func testEscaping(closure: @escaping () -> ()) {
    escapingClosure = closure
}

func callEscapingClosure() {
    escapingClosure?()
    escapingClosure = nil
}

struct TestValueType {
    var someValue = 1

    // self захватывается неявно
    func firstTestFunc() {
        testEscaping {
            print(someValue)
        }
    }

    // escaping closure не может захватить mutable self
    mutating func secondTestFunc() {
        testEscaping {
            someValue += 10
            print(someValue)
        }
    }
}
//: [Next](@next)
