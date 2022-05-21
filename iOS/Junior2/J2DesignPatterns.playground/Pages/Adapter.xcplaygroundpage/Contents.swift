/*:
 [Previous](@previous)

 ---

 # Adapter (Адаптер)

 ---

 Адаптер - паттерн, который позволяет объектам с несовместимыми интерфейсами работать вместе
 */
class Target {
    func request() -> String {
        return "Target: The default target's behavior"
    }
}

class Adaptee {
    func specificRequest() -> String {
        return ".eetpadA eht fo roivaheb laicepS"
    }
}

class Adapter: Target {
    private var adaptee: Adaptee

    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }

    override func request() -> String {
        return "Adapter: (TRANSLATED) " + adaptee.specificRequest().reversed()
    }
}

class Client {
    static func someClientCode(target: Target) {
        print(target.request())
    }
}

Client.someClientCode(target: Target())
let adaptee = Adaptee()
adaptee.specificRequest()
Client.someClientCode(target: Adapter(adaptee: adaptee))
/*:
 Необходим, когда нужно использовать сторонний класс, но его интерфейс не соответствует существующему коду.

 Преимущества:
 - Скрывает от клиента подробности преобразование различных интерфейсов

 Недостатки:
 - Усложняет код дополнительными классами
 
 ---

 [Next](@next)
 */
