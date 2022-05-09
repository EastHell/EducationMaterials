/*:
 [Previous](@previous)

 [Какие есть способы обработать ошибку? Чем они отличаются?](ErrorHandling)

 ---

 ## Еще немного про опциональное значение

 ---

 - Note: Стоит отметить что это касается так-же и функций, которые ничего не возвращают. На самом деле функции, в
 возвращаемых значениях которых явно ничего не указано - возвращают единственное значение `()` типа `Void`.
 Соответственно функция, которая может выбросить исключение при преобразовании в опциональное значение,
 возвращает `Void?`
 */
enum TestError: Error {
    case exampleCase
}

func testFunction() {
}

// testResult имеет тип Void и будет иметь значение ()
let testResult: Void = testFunction()

func testThrowingFunction() throws {
    throw TestError.exampleCase
}

// result имеет тип Void? и может иметь значение () или nil
let throwingResult: Void? = try? testThrowingFunction()
/*:
 ---

 [Next](@next)
 */
