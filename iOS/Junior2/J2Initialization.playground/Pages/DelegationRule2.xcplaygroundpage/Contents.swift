/*:

 # Какие есть правила делегирования инициализаторов для классов?

 ---

 2) Convenience инициализатор обязан вызвать другой инициализатор того-же класса
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

    convenience init() {
        self.init(value: .zero)
    }

    convenience init(value: String) {
        guard let value = Int(value) else {
            self.init()

            return
        }

        self.init(value: value)
    }
}
/*:
 ---

 [Next](@next)
 */
