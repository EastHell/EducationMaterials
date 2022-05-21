/*:
 [Previous](@previous)

 ---

 # Bridge (Мост)

 ---

 Мост - паттерн, разделяющий абстракцию и реализацию так, чтобы они могли изменяться независимо.
 */
protocol Implementation {
    func operationImplementation() -> String
}

class Abstraction {
    let implementation: Implementation

    init(implementation: Implementation) {
        self.implementation = implementation
    }

    func operation() -> String {
        let operation = implementation.operationImplementation()
        return "Abstraction: Base operation with:\n" + operation
    }
}

class ExtendedAbsctraction: Abstraction {
    override func operation() -> String {
        let operation = implementation.operationImplementation()
        return "ExtendedAbstraction: Extended operation with:\n" + operation
    }
}

class ConcreteImplementationA: Implementation {
    func operationImplementation() -> String {
        return "ConcreteImplementationA: Here's result of ConcreteImplementationA operation"
    }
}

class ConcreteImplementationB: Implementation {
    func operationImplementation() -> String {
        return "ConcreteImplementationB: Here's result of ConcreteImplementationB operation"
    }
}

class Client {
    static func someClientCode(with abstraction: Abstraction) {
        print(abstraction.operation())
    }
}

let implementationA = ConcreteImplementationA()
Client.someClientCode(with: Abstraction(implementation: implementationA))

let implementationB = ConcreteImplementationB()
Client.someClientCode(with: ExtendedAbsctraction(implementation: implementationB))
/*:
 Применяется когда необходимо разделить монолитный класс, который содержит несколько различных реализаций какой-то
 функциональности. Когда класс необходимо расширять в двух независимых плоскостях. Когда необходимо иметь возможность
 изменять реализацию во время выполнения программы.

 Достоинства:
 - Скрывает лишние детали от клиентского кода
 - Реализует принцип открытости / закрытости. Изменения в реализации не потребуют изменений в абстракции.

 Недостатки:
 - Усложняет код вводя дополнительные классы

 ---

 [Next](@next)
 */
