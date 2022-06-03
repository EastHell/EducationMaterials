/*:
 [Previous](@previous)

 ---

 # Mediator (Посредник)

 ---

 Посредник - паттерн, который позволяет уменьшить связность множества классов между собой, благодаря перемещению этих
 связей в один класс-посредник.
 */
class BaseComponent {
    weak var mediator: Mediator?

    init(mediator: Mediator? = nil) {
        self.mediator = mediator
    }

    func update(mediator: Mediator) {
        self.mediator = mediator
    }
}

protocol Mediator: AnyObject {
    func notify(sender: BaseComponent, event: String)
}

class Component1: BaseComponent {
    func doA() {
        print("Component 1 does A.")
        mediator?.notify(sender: self, event: "A")
    }

    func doB() {
        print("Component 1 does B.")
        mediator?.notify(sender: self, event: "B")
    }
}

class Component2: BaseComponent {
    func doC() {
        print("Component 2 does C.")
        mediator?.notify(sender: self, event: "C")
    }

    func doD() {
        print("Component 2 does D.")
        mediator?.notify(sender: self, event: "D")
    }
}

class ConcreteMediator: Mediator {
    private var component1: Component1
    private var component2: Component2

    init(_ component1: Component1, _ component2: Component2) {
        self.component1 = component1
        self.component2 = component2

        component1.update(mediator: self)
        component2.update(mediator: self)
    }

    func notify(sender: BaseComponent, event: String) {
        if event == "A" {
            print("Mediator reacts on A and triggers following operations:")
            self.component2.doC()
        } else if event == "D" {
            print("Mediator reacts on D and triggers following operations:")
            self.component1.doB()
            self.component2.doC()
        }
    }
}

let component1 = Component1()
let component2 = Component2()

let mediator = ConcreteMediator(component1, component2)
print("Trigger operation A.")
component1.doA()

print("Trigger operation D.")
component2.doD()

print(mediator)
/*:
 Применяется, когда сложно менять некоторые классы из-за того, что они имеют множество хаотичных связей с другими классами.
 Когда невозможно повторно использовать класс, поскольку он зависит от уймы других классов. Когда приходится создавать
 множество подклассов компонентов, чтобы использовать один и те же компоненты в раных контекстах.

 Преимущества:
 - Устраняет зависимости между компонентами, позволяя повторно их использовать
 - Упрощает взаимодействие между компонентами
 - Централизует управление в одном месте

 Недостатки:
 - Посредник может сильно раздуться

 ---

 [Next](@next)
 */
