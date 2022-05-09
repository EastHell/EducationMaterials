/*:
 # В каких случаях нужно применять `guard` вместо `if`?

 ---

 `guard` очень полезно применять в комбинации с optional binding. Поскольку распакованная переменная доступна во всем
 остальном теле функции. Что означает, что при распаковке нескольких опционалов не возникнет большого уровня вложенности.

 ---
 */
func handle(result: String?, code: Int?) {
    guard let code = code else {
        print("Some handling for code = nil")
        return
    }

    guard let result = result else {
        print("Some handling for result = nil")
        return
    }

    print("Do something with unwrapped result = \(result) and unwrapped code = \(code)")
}
/*:
 ---

 [Pervious](@pervious) | [Next](@next)

 [`Guard` & `Defer`](Guard&Defer)
 */
