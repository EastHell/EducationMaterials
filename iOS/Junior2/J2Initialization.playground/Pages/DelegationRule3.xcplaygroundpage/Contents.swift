/*:

 # Какие есть правила делегирования инициализаторов для классов?

 ---

 3) Convenience инициализатор должен в конечном итоге вызвать designated инициализатор
 */
class A {
    let value: Int

    init(value: Int) {
        self.value = value
    }

    convenience init(value: String) {
        guard let value = Int(value) else {
            self.init(value: .zero)

            return
        }

        self.init(value: value)
    }

    convenience init() {
        self.init(value: "")
    }
}
/*:
 ---

 [Next](@next)
 */
