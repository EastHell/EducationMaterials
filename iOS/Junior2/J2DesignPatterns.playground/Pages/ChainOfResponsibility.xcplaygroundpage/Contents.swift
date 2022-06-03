/*:
 [Previous](@previous)

 ---

 # Chain of responsibility (Цепочка обязанностей)

 ---

 Цепочка обязанностей - паттерн который позволяет передавать запросы последовательно по цепочке обработчиков. Каждый
 последующий обработчик решает, может ли он обработать запрос сам и стоит ли передавать запрос дальше по цепочке.
 */
protocol Handler: AnyObject {
    var nextHandler: Handler? { get set }

    @discardableResult
    func setNext(handler: Handler) -> Handler
    func handle(request: String) -> String?
}

extension Handler {
    func setNext(handler: Handler) -> Handler {
        self.nextHandler = handler

        return handler
    }

    func handle(request: String) -> String? {
        return nextHandler?.handle(request: request)
    }
}

class MonkeyHandler: Handler {
    var nextHandler: Handler?

    func handle(request: String) -> String? {
        if request == "Banana" {
            return "Monkey: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class SquirrelHanlder: Handler {
    var nextHandler: Handler?

    func handle(request: String) -> String? {
        if request == "Nut" {
            return "Squirrel: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class DogHandler: Handler {
    var nextHandler: Handler?

    func handle(request: String) -> String? {
        if request == "MeatBall" {
            return "Dog: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

func someCode(handler: Handler) {
    let food = ["Nut", "Banana", "Cup of coffee"]

    for item in food {
        print("Who wants a " + item + "?\n")

        guard let result = handler.handle(request: item) else {
            print(" " + item + " was left untouched.\n")

            return
        }

        print(" " + result)
    }
}

let monkey = MonkeyHandler()
let squirrel = SquirrelHanlder()
let dog = DogHandler()

monkey.setNext(handler: squirrel).setNext(handler: dog)

someCode(handler: monkey)
/*:
 Применяется когда нужно обрабатывать разнообразные запросы несколькими способами, но заранее неизвестно, какие конкретно
 запросы будут приходить и какие обработчики для них понадобятся. Когда важно чтобы обработчики выполнялись один за одним
 в определенном порядке. Когда набор объектов, способных обработать запрос, должен задаваться динамически.

 Преимущества:
 - Уменьшает зависимость между клиентом и обработчиками
 - Реализует принцип единственной ответственности
 - Реализует принцип октрытости / закрытости.

 Недостатки:
 - Запрос может остаться никем не обработанным.

 ---

 [Next](@next)
 */
