/*:
 [Previous](@previous)

 ---

 # Facade (Фасад)

 ---

 Фасад - паттерн который предоставляет простой интерфейс к сложной системе классов, библиотеке или фреймворку.
 */
class Subsystem1 {
    func operation1() -> String {
        return "Subsystem1: Ready!\n"
    }

    func operationN() -> String {
        return "Subsystem1: Go!\n"
    }
}

class Subsystem2 {
    func operation1() -> String {
        return "Subsystem2: Get ready!\n"
    }

    func operationN() -> String {
        return "Subsystem2: Fire!\n"
    }
}

class Facade {
    private var subsystem1: Subsystem1
    private var subsystem2: Subsystem2

    init(subsystem1: Subsystem1 = .init(),
         subsystem2: Subsystem2 = .init()) {
        self.subsystem1 = subsystem1
        self.subsystem2 = subsystem2
    }

    func operation() -> String {
        return "Facade initializes subsystems:\n"
        + " "
        + subsystem1.operation1()
        + " "
        + subsystem2.operation1()
        + "\nFacade orders subsystems to perform the action:\n"
        + " "
        + subsystem1.operationN()
        + " "
        + subsystem2.operationN()
    }
}

print(Facade().operation())
/*:
 Применяется когда представить простой или урезанный интерфейс к сложной подсистеме, или когда нужно разложить подсистему на
 отдельные слои.

 Преимущества:
 - Изолирует клиентов от компонентов сложной подсистемы

 Недостатки:
 - Фасад может стать god object, привязанным ко всем классам программы.
 
 ---

 [Next](@next)
 */
