/*:
 [Previous](@previous)
 
 [Чем отличается `escaping` **closure** от **noescape**?](EscapingVSNoescape)

 ## **noescape**

 **noescape closure** обычно вызывается в теле функции в которую передается, и по завершении функции освобождается.
 */
// Вызываем closure в теле функции, не продлевая его жизнь
func testNoescape(closure: () -> ()) {
    closure()
}

print("[Begin] noescape initialization")

testNoescape {
    print("Hello noescape")
}

print("[End] noescape initialization")
//: [Next](@next)
