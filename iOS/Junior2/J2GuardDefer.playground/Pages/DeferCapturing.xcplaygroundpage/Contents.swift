/*:
 Выражение `defer` не захватывает текущие значния переменных. Вместо этого, будет использоваться последнее значение
 переменной оказавшееся в ней к моменту выполнения блока `defer`.

 ---
 */
func deferExample() {
    var value = 1

    defer {
        print(value)
    }

    value += 1
}

deferExample()
/*:
 ---

 [Pervious](@pervious) | [Next](@next)
 */
