/*:
 [Previous](@previous)

 ---

 # Prototype (Прототип)

 ---

 Прототип - это паттерн, позволяющий копировать объекты, не вдаваясь в детали их реализации.
 */
protocol Copying {
    func copy() -> Self
}

class BaseClass: Copying {
    private var intValue = 1

    init(intValue: Int) {
        self.intValue = intValue
    }

    required init(base: BaseClass) {
        self.intValue = base.intValue
    }

    func copy() -> Self {
        type(of: self).init(base: self)
    }
}

protocol TestProtocol: Copying {
    func getValue() -> String
}

class SubClass: BaseClass, TestProtocol {
    private var stringValue = "Value"

    func getValue() -> String {
        stringValue
    }

    init(intValue: Int, stringValue: String) {
        self.stringValue = stringValue

        super.init(intValue: intValue)
    }

    required init(base: SubClass) {
        self.stringValue = base.stringValue

        super.init(base: base)
    }

    required init(base: BaseClass) {
        fatalError("init(base:) has not been implemented")
    }

    override func copy() -> Self {
        return type(of: self).init(base: self)
    }
}

let original: TestProtocol = SubClass(intValue: 3, stringValue: "123123123")
let copy = original.copy()

original.getValue() == copy.getValue()
/*:
 Позволяет избежать взаимодействия с конкретными реализациями и следовать принципу программирования через интерфейсы
 (протоколы).

 Недостаток в Swift - в каждом наследнике будет необходимо реализовать `required init` всех базовых классов и добавить свой,
 а так-же реализовать метод `copy()`

 ---

 [Next](@next)
 */
