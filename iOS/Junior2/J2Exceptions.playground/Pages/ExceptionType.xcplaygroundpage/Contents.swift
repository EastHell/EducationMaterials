/*:
 [Pervious](@previous)

 [Exceptions](ExceptionsJ2)

 ---
 
 # Как создать тип ошибки?

 ---

 Для того чтобы создать тип ошибки, достаточно чтобы пользовательский тип реализовывал протокол `Error`.
 */
enum RocketError: Error {
    case rocketExplosion
    case outOfFuel
    case UFOAttack(aliensCount: Int)
}
/*:
 ---

 [Next](@next)
 */
