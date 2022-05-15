/*:
 [Previous](@previous)

 ---

 # Factory method (Фабричный метод)

 ---

 Фабричный метод - это паттерн, который определяет общий интерфейс (Creator) для создания объектов (Products), позволяя
 объектам его реализующим (ConcreteCreators) определять тип создаваемых объектов (ConcreteProducts).
 */
protocol Product {
    func operation() -> String
}

class ConcreteProductA: Product {
    func operation() -> String {
        "Result of the ConcreteProductA"
    }
}

class ConcreteProductB: Product {
    func operation() -> String {
        "Result of the ConcreteProductB"
    }
}

protocol Creator {
    func factoryMethod() -> Product
    func someOperation() -> String
}

extension Creator {
    func someOperation() -> String {
        let product = factoryMethod()

        return "Creator: worked with: " + product.operation()
    }
}

class ConcreteCreatorA: Creator {
    func factoryMethod() -> Product {
        ConcreteProductA()
    }
}

class ConcreteCreatorB: Creator {
    func factoryMethod() -> Product {
        ConcreteProductB()
    }
}

class Client {
    static func someClientCode(creator: Creator) {
        print("Client: result of creator \n" + creator.someOperation())
    }
}

Client.someClientCode(creator: ConcreteCreatorA())
Client.someClientCode(creator: ConcreteCreatorB())
/*:
 Когда может помочь:
 - Когда базовому классу неизвестно объекты какого типа ему нужно создавать.
 - Когда класс спроектирован так, что объекты, которые он создает, должны специфицироваться подклассами.
 - Когда класс делегирует свои обязанности одному из нескольких вспомогательных классов, и планируется локализовать
 знание о том, какой подкласс принимает эти обязанности на себя

 Достоинства:
 - Позволяет сделать код создания объектов более универсальным, не привязываясь к конкретным классам продуктов, а оперируя
 лишь общим интерфейсом.
 - Позволяет установить связь между парралельными иерархиями классов

 Недостатки:
 - Необходимо создавать наследника для каждого нового типа продукта.
 
 ---

 [Next](@next)
 */
