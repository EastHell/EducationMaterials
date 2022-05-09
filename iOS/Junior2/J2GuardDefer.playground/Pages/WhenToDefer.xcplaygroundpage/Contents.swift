/*:
 # В каких случаях нужно применять `defer`?

 ---

 Выражение `defer` отлично подходит для закрытия контекста или освобождения ресурсов. Если в процессе написания кода,
 у вас появляется мысль "надо бы не забыть (сделать что-то) потом", то в этот момент можно задуматься над использованием
 выражения `defer`.

 ---

 - Important: Не стоит использовать `defer` для каких-то хитрых хаков, поскольку это только усложнит читаемость.

 ---

 - Note: `defer` не самая популярная конструкция, и необходимость в нем становится все меньше и меньше. Так вместо
 связки `tableView.beginUpdates()` и `tableView.endUpdates()`, последний из которых идеально подходил под использование
 в выражении `defer`. Теперь можно использовать `tableView.performBatchUpdates(_:completion:)`, а так-же
 при работе с контекстами, возможно вместо `defer` можно будет использовать `@propertyWrapper`

 ---
 */
import UIKit

func deferExample() {
    guard let context = UIGraphicsGetCurrentContext() else {
        return
    }
    context.saveGState()

    defer {
        context.restoreGState()
    }

    print("Здесь совершаются какие-нибудь действия с context")
}
/*:
 ---

 [Pervious](@pervious) | [Next](@next)

 [`Guard` & `Defer`](Guard&Defer)
 */
