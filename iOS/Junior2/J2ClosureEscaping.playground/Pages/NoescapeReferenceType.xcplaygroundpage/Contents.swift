/*:
 [Previous](@previous)

 [Каким образом захватывается переменная если **closure**](EscapingValueType)

 # Каким образом захватывается переменная если **closure**:
 # **noescape**, переменная **reference type**

 В случае с **reference type**, при захвате ссылки на `self` в **noescape closure**, захват происходит неявно по сильной
 ссылке, но никаких проблем с **reference cycle** не возникает, поскольку **closure** отрабатывает сразу и нигде не
 сохраняется.
 И по завершению метода в который **closure** передается вместе с **closure** будет особождена и сильная ссылка на `self`.
 */
func testNoescape(closure: () -> ()) {
    closure()
}

class TestReferenceType {
    var testValue = 1

    func testFunc() {
        // self захватывается неявно, проблем с reference cycle не возникает
        testNoescape {
            testValue += 10
            print(testValue)
        }
    }
}
