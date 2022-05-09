/*:
 [Previous](@previous)
 
 [**Closure** `Escaping`](ClosureEscaping)

 # Чем отличается `escaping` **closure** от **noescape**?

 ## `escaping` **closure**

 `escaping` **closure** подразумевает, что жизненный цикл **closure** будет продлен и выйдет за рамки функции в которую он
 передается.
 */
// Хранилище для closure
var escapingClosure: (() -> ())?

// Функция в которую передается closure
func testEscaping(closure: @escaping () -> ()) {
    // Сохраняет closure, тем самым продлевая его жизненный цикл за пределы функции testEscaping(closure:)
    escapingClosure = closure
}

// Вызывает closure и обнуляет ссылку на него
func callEscaping() {
    escapingClosure?()
    escapingClosure = nil
}

print("[Begin] escaping initialization")

testEscaping {
    print("Hello escaping world!")
}

print("[End] escaping initialization")

callEscaping()
//: [Next](@next)
