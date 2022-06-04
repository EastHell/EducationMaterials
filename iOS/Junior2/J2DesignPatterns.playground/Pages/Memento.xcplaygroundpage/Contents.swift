/*:
 [Previous](@previous)

 ---

 # Memento (Снимок)

 ---

 Снимок - паттерн, который позволяет сохранять и восстанавливать прошлые состояния объектов, не расскрывая подробностей их
 реализации.
 */

import Foundation
class Originator {
    private var state: String

    init(state: String) {
        self.state = state
        print("Originator: My initial state is: \(state)")
    }

    func doSomething() {
        print("Originator: I'm doing something important.")
        state = generateRandomString()
        print("Originator: and my state has changed to: \(state)")
    }

    private func generateRandomString() -> String {
        return String(UUID().uuidString.suffix(4))
    }

    func save() -> Memento {
        return ConcreteMemento(state: state)
    }

    func restore(memento: Memento) {
        guard let memento = memento as? ConcreteMemento else { return }
        self.state = memento.state
        print("Originator: My state has changed to: \(state)")
    }
}

protocol Memento {
    var name: String { get }
    var date: Date { get }
}

class ConcreteMemento: Memento {
    private(set) var state: String
    private(set) var date: Date

    var name: String { return state + " " + date.description.suffix(14).prefix(8) }

    init(state: String) {
        self.state = state
        self.date = Date()
    }
}

class Caretaker {
    private var mementos = [Memento]()
    private var originator: Originator

    init(originator: Originator) {
        self.originator = originator
    }

    func backup() {
        print("\nCaretaker: Saving Originator's state...\n")
        mementos.append(originator.save())
    }

    func undo() {
        guard !mementos.isEmpty else { return }
        let removedMemento = mementos.removeLast()
        print("Caretaker: Restoring state to: " + removedMemento.name)
        originator.restore(memento: removedMemento)
    }

    func showHistory() {
        print("Caretaker: Here's the list of mementos:\n")
        mementos.forEach { print($0.name) }
    }
}

let originator = Originator(state: "Super-duper-super-puper-super.")
let caretaker = Caretaker(originator: originator)

caretaker.backup()
originator.doSomething()

caretaker.backup()
originator.doSomething()

caretaker.backup()
originator.doSomething()

print("\n")
caretaker.showHistory()

print("\nNow, let's rollback!\n\n")
caretaker.undo()

print("\nOnce more!\n\n")
caretaker.undo()
/*:
 Применяется, когда необходимо сохранять мгновенные снимки состояния объекта (или его части), чтобы впоследствии объект
 можно было восстановить в том же состоянии. Когда прямое получение состояния объекта раскрывает приватные детали его
 реализации, нарушая инкапсуляцию.

 Преимущества:
 - Не нарушает инкапсуляции исходного объекта
 - Упрощает структуру исходного объекта. Ему не нужно хранить историю версий своего состояния

 Недостатки:
 - Требует много памяти, если клиенты слишком часто создают снимки
 - Может повлечь дополнительные издержки памяти, если объекты, хранящие историю, не освобождают ресурсы, занятые устаревшими
 снимками

 ---

 [Next](@next)
 */
