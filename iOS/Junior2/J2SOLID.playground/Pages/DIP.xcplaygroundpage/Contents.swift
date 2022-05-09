/*:
 [Previous](@previous)

 ---

 # DIP

 ---

 * Callout(Смысл):
 Объекты не должны содержать в себе свойства конкретных экземпляров. Вместо этого, они должны содержать в себе их абстракции.
 */
import Foundation

class ConcreteKeyboard {
    var onButtonPressed: ((Character) -> Void)?
}

class ConcreteMonitor {
    func show(data: Data?) {

    }
}

class ConcreteComputer {
    let keyboard = ConcreteKeyboard()
    let monitor = ConcreteMonitor()

    func doSomeStuff() {
        keyboard.onButtonPressed = {
            print($0)
        }

        monitor.show(data: nil)
    }
}
/*:
 Из за того что монитор и клавиатура представлены конкретными экземплярами - мы не можем заменить их другими, реализующими
 схожий функционал объектами.

 ---
 */
protocol Keyboard: AnyObject {
    var onButtonPressed: ((Character) -> Void)? { get set }
}

protocol Monitor {
    func show(data: Data?)
}

class Computer {
    let keyboard: Keyboard
    let monitor: Monitor

    init(keyboard: Keyboard, monitor: Monitor) {
        self.keyboard = keyboard
        self.monitor = monitor
    }

    func doSomeStuff() {
        keyboard.onButtonPressed = {
            print($0)
        }

        monitor.show(data: nil)
    }
}
/*:
 Теперь мы можем подставить в компьютер любые клавиатуры и мониторы реализующие соответствующий протокол.
 */
