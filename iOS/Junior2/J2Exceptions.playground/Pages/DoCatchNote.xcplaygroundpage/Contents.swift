/*:
 [Previous](@previous)

 [Какие есть способы обработать ошибку? Чем они отличаются?](ErrorHandling)

 ---

 ## Еще немного про `do`-`catch`

 ---

 - Note: Важно отметить, что не требуется обрабатывать все возможные варианты ошибок, необработанные ошибки можно
 оставить для обработки в вызывающую функцию.
 */
enum RocketError: Error {
    case rocketExplosion
    case outOfFuel
    case UFOAttack(aliensCount: Int)
}

func throwingFunction() throws {
    throw RocketError.UFOAttack(aliensCount: 3)
}

func anotherThrowingFunction() throws {
    do {
        print("Some code before error throwing")
        // Если будет выброшена ошибка не указанная в шаблонах catch - то она будет выброшена в область вызова функции
        // anotherThrowingFunction
        try throwingFunction()
        print("Some code after error throwing")
    } catch RocketError.rocketExplosion {
        print("Rocket explosion!")
    }
}
/*:
 ---

 [Next](@next)
 */
