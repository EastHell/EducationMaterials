/*:
 [Pervious](@previous)

 [Как создать тип ошибки?](ExceptionType)

 ---

 ## Дополнительно о возможных типах ошибки

 ---

 Ввиду сказанного ранее, можно понять, что в целом протокол `Error` может реализовывать любой пользовательский тип.
 Но в большинстве известных случаев лучше всего подходит `enum`.
 */
class TestClassError: Error {
    // Полезная информация об ошибке
}

struct TestStructError: Error {
    // Полезная информация об ошибке
}

enum TestEnumError: Error {
    // Полезная информация об ошибке
}
/*:
 ---

 [Next](@next)
 */
