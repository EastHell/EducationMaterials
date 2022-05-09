/*:
 # Как работает выражение `guard`?

 ---

 `Guard` - это условный оператор, требующий чтобы выражение внутри него было `true`, для того чтобы продолжить выполнение.
 Если выражение внутри `guard` равно `false`, вместо дальнейшего выполнения выполнится блок `else`.

 ---
 */
func guardExample() {
    let condition = Bool.random()

    guard condition else {
        print("Тело else выполнится, если condition = false")
        return
    }

    print("Выполнение продолжится, если condition = true")
}

guardExample()
/*:
 ---

 [Pervious](@pervious) | [Next](@next)

 [`Guard` & `Defer`](Guard&Defer)
 */
