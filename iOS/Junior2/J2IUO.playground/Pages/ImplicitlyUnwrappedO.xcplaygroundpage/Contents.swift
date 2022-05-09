/*:
 [Previous](@previous)

 ---

 - Note: IUO Не распаковывается без необходимости
 */
let variableA: Int! = 10
let variableB = variableA
// variableB будет иметь тип Optional<Int>
print(type(of: variableB))

// variableA распакуется, чтобы сохранить значние в variableC
let variableC: Int = variableA
/*:
 ---

 [Next](@next)
 */
