/*:
 [Previous](@previous)

 ---

 # Composite (Компоновщик)

 ---

 Компоновщик - паттерн, который позволяет объединять объекты в древовидную структуру и работать с ней так, словно это
 один объект.
 */
protocol Component {
    var parent: Component? { get set }
    var isComposite: Bool { get }

    func add(component: Component)
    func remove(component: Component)

    func operation() -> String
}

extension Component {
    var isComposite: Bool {
        false
    }

    func add(component: Component) { }
    func remove(component: Component) { }
}

class Leaf: Component {
    var parent: Component?

    func operation() -> String {
        return "Leaf"
    }
}

class Composite: Component {
    private var children = [Component]()

    var parent: Component?

    var isComposite: Bool {
        true
    }

    func add(component: Component) {
        var item = component
        item.parent = self
        children.append(item)
    }

    func remove(component: Component) {

    }

    func operation() -> String {
        let result = children.map { $0.operation() }

        return "Branch(" + result.joined(separator: " ") + ")"
    }
}

class Client {
    static func someClientCode(component: Component) {
        print("Result: " + component.operation())
    }

    static func moreComplexClientCode(leftComponent: Component, rightComponent: Component) {
        if leftComponent.isComposite {
            leftComponent.add(component: rightComponent)
        }

        print("Result: " + leftComponent.operation())
    }
}

Client.someClientCode(component: Leaf())

let tree = Composite()

let branch1 = Composite()
branch1.add(component: Leaf())
branch1.add(component: Leaf())

let branch2 = Composite()
branch2.add(component: Leaf())
branch2.add(component: Leaf())

tree.add(component: branch1)
tree.add(component: branch2)

Client.someClientCode(component: tree)

Client.moreComplexClientCode(leftComponent: tree, rightComponent: Leaf())
/*:
 Применяется, когда необходимо предоставить древовидную структуру объектов, а так-же когда клиенты должны единообразно
 работать с простыми и составными объектами.

 Преимущества:
 - Упрощает работу со сложным деревом компонентов
 - Облегчает добавление новых видов компонентов

 Недостатки:
 - Создает слишком общий дизайн классов
 ---

 [Next](@next)
 */
