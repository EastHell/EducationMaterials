/*:
 [Previous](@previous)
 
 [Какой используется по умолчанию и почему?](ByDefault)

 - Note:
 Стоит отметить, что, если **closure** будет **optional**, то он по умолчанию становится `escaping`
 */
var escapingClosure: (() -> ())?

func testEscaping(closure: (() -> ())?) {
    escapingClosure = closure
}

func callEscaping() {
    escapingClosure?()
    escapingClosure = nil
}
//: [Next](@next)
