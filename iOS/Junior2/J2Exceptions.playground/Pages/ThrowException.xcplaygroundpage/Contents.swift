/*:
 [Previous](@previous)

 [Exceptions](ExceptionsJ2)

 ---

 # Как выбросить ошибку?

 ---

 Для того чтобы выбросить ошибку необхоидмо использовать инструкцию `throw`, которая сгенерирует указанную ошибку, и
 вернет выполнение со сгенерированной ошибкой в вызывающий поток (похоже на работу `return`).
 */
enum TestError: Error {
    case exampleCase
}
/*:
 - Note: Стоит отметить, что функция, внутри которой может быть сгенерирована ошибка, должна иметь ключевое слово
 `throws` в своей реализации, после ее параметров, и перед возвращаемым значением (если оно есть)
 */
func testThrowingFunc() throws -> Int {
    throw TestError.exampleCase

    print("This code will never be executed")
}
/*:
 ---

 [Next](@next)
 */
