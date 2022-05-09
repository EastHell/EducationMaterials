/*:
 [Previous](@previous)

 [Exceptions](ExceptionsJ2)

 ---

 # Какие есть способы обработать ошибку? Чем они отличаются?

 ---

 Одним из способов обработать ошибку является передача обработки в вызывающую функцию. По сути в данном способе
 мы не обрабатываем ошибку, а передаем ее обработку на уровень выше. Для того чтобы его использовать, необходимо
 предварить вызываемую функцию инструкцией `try`
 */
enum TestError: Error {
    case exampleCase
}

// Эта функция генерирует ошибку и выбрасывет ее, возвращая исполнение в вызывающий поток
func firstThrowingFunction() throws {
    throw TestError.exampleCase
}

// Эта функция выбрасывает ошибку, сгенерированную функцией firstThrowingFunction, и передает обработку ошибки
// в область вызова функции secondThrowingFunction
func secondThrowingFunction() throws {
    try firstThrowingFunction()
}
/*:
 ---

 [Next](@next)
 */
