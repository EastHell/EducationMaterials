/*:
 [Previous](@previous)

 ---

 # LSP

 ---

 * Callout(Смысл):
 Наследник не должен нарушать работу базового класса.
 */
class Worker {
    func doWork() {
        // do some work
    }

    func eat() {
        // eat some food
    }
}

class Robot: Worker {
    override func doWork() {
        // do some work
    }

    override func eat() {
        assertionFailure("Robot can't eat")
    }
}
/*:
 Если где-нибудь в качестве `Worker` подставить `Robot`, то при вызове метода `eat()` произойдет неожиданное поведение.
 Здесь явно нарушено наследование.

 ---
 */
class ActualWorker {
    func doWork() {
        // do some work
    }
}

class HumanWorker: ActualWorker {
    func eat() {
        // eat some food
    }
}

class RobotWorker: ActualWorker {
    func recharge() {
        // recharge
    }
}
/*:
 Теперь мы не сможем вместо `HumanWorker` подставить `RobotWorker`, поскольку второй не является наследником первого.
 Зато можем сделать это с `ActualWorker` и `RobotWorker`, при этом не получив неожиданного поведения.

 ---

 [Next](@next)
 */
