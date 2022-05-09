/*:

 # Convenience initializer

 ---

 Convenience (удобные) инициализаторы - это вспомогательные инициализаторы для объекта. Они вызывают другие
 `convenience` или designated инициализаторы того-же объекта. В конечном итоге цепочка `convenience` инициализаторов
 обязана вызвать designated инициализатор того-же объекта. Они нужны чтобы задавать значения по умолчанию для
 вызываемых инициализаторов или инициализировать объект из нестандартного набора входных данных.
 */
class A {
    let value: Int

    // Designated инициализатор
    init(value: Int) {
        self.value = value
    }

    // Convenience инициализатор
    convenience init() {
        // Вызывает designated инициализатор, со значением по умолчанию
        self.init(value: .zero)
    }

    // Еще один `convinience` инициализатор, для инициализации нестандартными данными
    convenience init(value: String) {
        guard let value = Int(value) else {
            // Вызывает `convenience` инициалитор, который в свою очередь вызовет designated
            self.init()

            return
        }

        // Или вызывает designated инициализатор, после получения необходимых данных
        self.init(value: value)
    }
}

A(value: 10)
A()
A(value: "Not a number")
A(value: "3")
/*:
 ---

 [Next](@next)
 */
