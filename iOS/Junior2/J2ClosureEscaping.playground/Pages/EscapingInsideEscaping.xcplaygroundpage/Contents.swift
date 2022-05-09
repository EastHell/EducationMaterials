/*:
 [Previous](@previous)
 
 [Какой используется по умолчанию и почему?](ByDefault)

 - Note:
 Так-же стоит отметить, что **closure** который захватывается внутри `escaping` **closure**, тоже должен быть `escaping`.
 */
var escapingClosure: (() -> ())? = nil

func addEscaping(closure: @escaping () -> ()) {
    escapingClosure = closure
}

func callEscapingClosure() {
    escapingClosure?()
    escapingClosure = nil
}

func testEscaping(closure: () -> ()) {
    // Захватываем closure внутри escaping
    addEscaping {
        closure()
    }
}
//: [Next](@next)
