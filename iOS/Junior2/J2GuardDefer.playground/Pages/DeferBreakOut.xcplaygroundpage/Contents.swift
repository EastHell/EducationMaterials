/*:
 - Note: Выражение `defer` не может вернуть значение функции или выбросить ошибку за пределы блока кода, в котором
 вызывается. В случае с обработкой исключений - ее придется совершать внутри блока `defer`.

 ---
 */
enum ErrorExample: Error {
    case somethingWentWrong
}

func throwableFunction() throws {
    throw ErrorExample.somethingWentWrong
}

func deferExample() -> Int {
    defer {
        try throwableFunction()
    }

    defer {
        return 3
    }

    return 1
}

deferExample()
/*:
 [Pervious](@pervious)

 [`Guard` & `Defer`](Guard&Defer)
 */
