/*:
 В теле `else` оператора `guard` всегда должен быть оператор, завершающий выполнение текущего блока кода. Например
 `return`, `throw`, `continue`, `break` или `fatalError(_:file:line:)` для функций который возвращают `Never`

 ---
 */
enum ExampleError: Error {
    case somethingWentWrong
}

func guardExample() throws {
    let firstExpression = Bool.random()

    guard firstExpression else {
        // Завершает выполнение тела функции guardExample()
        return
    }

    let secondExpression = Bool.random()

    guard secondExpression else {
        // Завершает выполнение тела функции guardExample()
        throw ExampleError.somethingWentWrong
    }

    for i in 0..<10 {
        guard i < 8 else {
            // Завершает выполнение цикла for
            break
        }

        guard i % 2 == 0 else {
            // Завершает выполнение тела текущей итерации цикла for
            continue
        }
    }
}

try? guardExample()

func neverGuardExample() -> Never {
    let expression = Bool.random()

    guard expression else {
        // Завершает выполнение функции neverGuardExample()
        fatalError("Something went wrong with expression = false")
    }

    fatalError("Something went wrong with expression = true")
}

neverGuardExample()
/*:
 ---

 [Pervious](@pervious) | [Next](@next)
 */
