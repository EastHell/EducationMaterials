/*:

 # Какие есть правила делегирования инициализаторов для классов?

 ---

 1) Designated инициализатор обязан вызывать designated инициализатор своего суперкласса
 */
class A {
    let value: Int

    init(value: Int) {
        self.value = value
    }
}

class B: A {
    let description: String

    override init(value: Int) {
        description = value.description

        super.init(value: value)
    }
}
/*:
 ---

 [Next](@next)
 */
