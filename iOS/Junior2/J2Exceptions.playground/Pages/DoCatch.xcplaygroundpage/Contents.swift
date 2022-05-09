/*:
 [Previous](@previous)

 [Какие есть способы обработать ошибку? Чем они отличаются?](ErrorHandling)

 ---

 ## `do`-`catch`

 ---

 Еще одним способом обработки ошибки является инструкция `do`-`catch`. Данная инструкция очень похожа на
 конструкцию `switch`-`case`, только в `do` указывается не переменная, а блок кода, в котором может быть
 выброшено исключение, а в `catch` указывается шаблон ошибки которая будет обрабатываться и блок кода обработки ошибки.
 Конструкция `catch` без шаблона обработает все остальные ошибки, необработанные в предыдущих `catch`
 */
enum RocketError: Error {
    case rocketExplosion
    case outOfFuel
    case UFOAttack(aliensCount: Int)
}

func throwingFunction() throws {
    throw RocketError.UFOAttack(aliensCount: 3)
}

do {
    // Функция может и не выбросить ошибок, в таком случае выполнение продолжится без обработчиков catch
    try throwingFunction()
} catch RocketError.rocketExplosion {
    print("Rocket explosion!")
} catch let RocketError.UFOAttack(aliensCount: aliensCount) where aliensCount == 3 {
    print("\(aliensCount) aliens attack!")
} catch {
    // Этот код выполнится, если выброшенная ошибка не была обработана в предыдущих сatch
    print("Unexpected error")
}
/*:
 ---

 [Next](@next)
 */
