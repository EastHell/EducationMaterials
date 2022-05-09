/*:

 # Required модификатор

 ---

 Модификатор `required` в инициализаторе говорит о том, что каждый подкласс обязан реализовать этот инициализатор.
 При релазиации `required` инициализатора в подклассе, мы так-же обязаны добавить модификатор `required`.

 - Note:
    Модификатор `required` может быть использован в любых инициализаторах
 */
class A {
    let value: Int

    required init(value: Int) {
        self.value = value
    }

    required convenience init() {
        self.init(value: .zero)
    }
}

class B: A {
    let description: String

    // Обязательный инициализатор подкласса
    required init(value: Int) {
        self.description = value.description

        super.init(value: value)
    }
}

// Унаследованный инициализатор
B()
// Реализованный инициализатор
B(value: 10)
/*:
 ---

 [Next](@next)
 */
