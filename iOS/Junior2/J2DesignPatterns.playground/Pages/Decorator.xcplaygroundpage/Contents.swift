/*:
 [Previous](@previous)

 ---

 # Decorator (Декоратор)

 ---

 Декоратор - паттерн который позволяет динамически добалвять объектам новую функциональность, оборачивая их в полезные
 обертки.
 */
protocol Component {
    func operation() -> String
}

class ConcreteComponent: Component {
    func operation() -> String {
        return "ConcreteComponent"
    }
}

class Decorator: Component {
    private let component: Component

    init(component: Component) {
        self.component = component
    }

    func operation() -> String {
        return component.operation()
    }
}

class ConcreteDecoratorA: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorA(" + super.operation() + ")"
    }
}

class ConcreteDecoratorB: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorB(" + super.operation() + ")"
    }
}

class Client {
    static func someClientCode(component: Component) {
        print("Result: " + component.operation())
    }
}

let simple = ConcreteComponent()
Client.someClientCode(component: simple)

let decorator1 = ConcreteDecoratorA(component: simple)
let decorator2 = ConcreteDecoratorB(component: decorator1)
Client.someClientCode(component: decorator2)
/*:
 Применяется, когда необходимо добавлять обязанности объектам на лету, незаметно для кода, который их использует, а так-же
 когда нельзя расширить обязанности объекта с помощью наследования.

 Преимущества:
 - Большая гибкость чем у наследования
 - Позволяет добавлять обязанности налету
 - Можно добавлять несколько обязанностей сразу
 - Позволяет иметь несколько небольших объектов, вместо одного большого

 Недостатки:
 - Трудно конфигурировать многократно обернутые объекты
 - Очень много небольших классов

 ---

 [Next](@next)
 */
