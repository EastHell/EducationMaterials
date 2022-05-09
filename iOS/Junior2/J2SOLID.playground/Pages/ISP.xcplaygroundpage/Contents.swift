/*:
 [Previous](@previous)

 ---

 # ISP

 ---

 * Callout(Смысл):
 Интерфейс должен содержать минимальное количество информации необходимое для его использования
 */
protocol Worker {
    func doWork()
    func eat()
}

class Human: Worker {
    func doWork() {
        // do some work
    }

    func eat() {
        // eat some food
    }
}

class Robot: Worker {
    func doWork() {
        // do some work
    }

    func eat() {
        assertionFailure("Robots doesn't eat")
    }
}
/*:
 Поскольку протокол `Worker` содержит избыточные методы, то его клиентам необходимо дописывать реализацию, которая им не нужна.

 ---
 */
protocol WorkerProtocol {
    func doWork()
}

protocol HumanProtocol {
    func eat()
}

class HumanWorker: WorkerProtocol, HumanProtocol {
    func doWork() {
        // do some work
    }

    func eat() {
        // eat something
    }
}

class RobotWorker: WorkerProtocol {
    func doWork() {
        // do some work
    }
}
/*:
 Теперь типу `RobotWorker` нет необходимости иметь избыточную реализацию, поскольку протокол `WorkerProtocol` не содержит
 лишней информации.

 ---

 [Next](@next)
 */
