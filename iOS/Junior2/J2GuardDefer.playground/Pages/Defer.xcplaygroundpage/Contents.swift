/*:
 # Как работает выражение `defer`?

 ---

 Выражение `defer` выполняет указанные в нем инструкции, перед тем, как вернуть управление программой за пределы области
 кода в котором оно используется.

 ---
 */
func deferExample() {
    print("I run first")

    defer {
        print("I run last")
    }

    print("I run second")
}

deferExample()
/*:
 ---

 [Pervious](@pervious) | [Next](@next)

 [`Guard` & `Defer`](Guard&Defer)
 */
