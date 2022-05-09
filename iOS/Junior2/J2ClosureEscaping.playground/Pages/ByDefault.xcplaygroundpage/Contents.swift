/*:
 [Previous](@previous)
 
 [**Closure** `Escaping`](ClosureEscaping)

 # Какой используется по умолчанию и почему?

 По умолчанию используется **noescape closure**, причиной этому является то, что продление жизненного цикла **closure**
 может быть обнаружено с помощью статического анализатора кода. И в процессе его написания - разработчик получит
 предупреждение, о том, что необходимо добавить аннотацию `@escaping`
 */
var escapingClosure: (() -> ())?

func testEscaping(closure: () -> ()) {
    escapingClosure = closure
}

func callEscaping() {
    escapingClosure?()
    escapingClosure = nil
}
//: [Next](@next)
