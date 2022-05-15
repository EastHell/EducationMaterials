/*:
 [Previous](@previous)

 ---

 # Abstract factory (Абстрактная фабрика)

 ---

 Абстрактная фабрика - паттерн, который предоставляет интерфейс (AbstractFactory) для создания семейств взаимосвязанных или
 взаимозависимых объектов (AbstractProductA, AbstractProductB).
 */
protocol AbstractProductA {
    func usefulFunctionA() -> String
}

class ProductA1: AbstractProductA {
    func usefulFunctionA() -> String {
        "Result of product A1"
    }
}

class ProductA2: AbstractProductA {
    func usefulFunctionA() -> String {
        "Result of product A2"
    }
}

protocol AbstractProductB {
    func usefulFunctionB() -> String
    func anotherUsefulFunctionB(with productA: AbstractProductA) -> String
}

class ProductB1: AbstractProductB {
    func usefulFunctionB() -> String {
        "Result of product B1"
    }

    func anotherUsefulFunctionB(with productA: AbstractProductA) -> String {
        "Result of product B1 with " + productA.usefulFunctionA()
    }
}

class ProductB2: AbstractProductB {
    func usefulFunctionB() -> String {
        "Result of product B2"
    }

    func anotherUsefulFunctionB(with productA: AbstractProductA) -> String {
        "Result of product B2 with " + productA.usefulFunctionA()
    }
}

protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

class ConcreteFactory1: AbstractFactory {
    func createProductA() -> AbstractProductA {
        ProductA1()
    }

    func createProductB() -> AbstractProductB {
        ProductB1()
    }
}

class ConcreteFactory2: AbstractFactory {
    func createProductA() -> AbstractProductA {
        ProductA2()
    }

    func createProductB() -> AbstractProductB {
        ProductB2()
    }
}

class Client {
    static func someClientCode(factory: AbstractFactory) {
        let productA = factory.createProductA()
        let productB = factory.createProductB()

        print(productB.usefulFunctionB())
        print(productB.anotherUsefulFunctionB(with: productA))
    }
}

Client.someClientCode(factory: ConcreteFactory1())
Client.someClientCode(factory: ConcreteFactory2())
/*:
 Когда может помочь:
 - Когда система не должна зависеть от того, как создаются, компонуются и предоставляются входящие в нее объекты
 - Входящие в семейство взаимосвязанные объекты должны использоваться вместе и необходимо обеспечить выполнение этого
 ограничения
 - Система должна конфигурироваться одним из семейств составляющих ее объектов
 - Необходимо предоставить библиотеку объектов, раскрывая только их интерфейсы, но не их реализацию

 Достоинства:
 - Изолирует конкретные классы
 - Упрощает замену семейств продуктов
 - Гарантирует сочетаемость продуктов

 Недостатки:
 - Сложно добавить поддержку нового вида продуктов
 
 ---

 [Next](@next)
 */
