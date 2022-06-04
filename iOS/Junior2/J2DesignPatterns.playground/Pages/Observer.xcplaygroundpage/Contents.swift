/*:
 [Previous](@previous)

 ---

 # Observer (Наблюдатель)

 ---

 Наблюдатель - паттерн который создает механизм подписки, позволяющий одним объектам следить и реагировать на события,
 происходящие в других объектах.
 */
class Subject {
    var state: Int = { return Int.random(in: 0...10) }()
    var observers = [Observer]()

    func attach(_ observer: Observer) {
        print("Subject: Attached on observer.\n")
        observers.append(observer)
    }

    func detach(_ observer: Observer) {
        if let idx = observers.firstIndex { $0 === observer } {
            observers.remove(at: idx)
            print("Subject: Detached an observer.\n")
        }
    }

    func notify() {
        print("Subject: Notifying observers...\n")
        observers.forEach { $0.update(subject: self) }
    }

    func someBusinessLogic() {
        print("\nSubject: I'm doing something important.\n")
        state = Int.random(in: 0...10)
        print("Subject: My state has just changed to: \(state)\n")
        notify()
    }
}

protocol Observer: AnyObject {
    func update(subject: Subject)
}

class ConcreteObserverA: Observer {
    func update(subject: Subject) {
        if subject.state < 3 {
            print("ConcreteObserverA: Reacted to the event.\n")
        }
    }
}

class ConcreteObserverB: Observer {
    func update(subject: Subject) {
        if subject.state >= 3 {
            print("ConcreteObserverB: Reacted to the event.\n")
        }
    }
}

let subject = Subject()
let observer1 = ConcreteObserverA()
let observer2 = ConcreteObserverB()

subject.attach(observer1)
subject.attach(observer2)

subject.someBusinessLogic()
subject.someBusinessLogic()
subject.detach(observer2)
subject.someBusinessLogic()
/*:
 Применяется, когда после изменения состояния одного объекта, требуется что-то сделать в других, но неизвестно заранее,
 какие именно объекты должны отреагировать. Когда одни объекты, должны наблюдать за другими, но только в определенных случаях.

 Преимущества:
 - Издатели не зависят от конкретных классов подписки и наоборот
 - Можно подписывать и отписывать получателей на лету
 - Реализуется принцир открытости/закрытости

 Недостатки:
 - Подписчики оповещаются в случайном порядке

 ---

 [Next](@next)
 */
