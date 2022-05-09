/*:
 [Previous](@previous)

 ---

 # OCP

 ---

 * Callout(Смысл):
 Необходимо делать так, чтобы программная сущность не изменялась (кроме случаев багфиксов конечно), но ее можно было дополнить.
 */
import Foundation

class DataPrinter {
    func printToTerminal(data: Data) {
        // print to terminal
    }

    func printToUI(data: Data) {
        // print to UI
    }

    func printToPrinter(data: Data) {
        // print to Printer
    }
}

/*:
 Если понадобится добавить еще один способ вывода информации - нам придется изменять сущность `DataPrinter`

 ---
 */

protocol Printer {
    func print(data: Data)
}

class TerminalPrinter: Printer {
    func print(data: Data) {
        // print to terminal
    }
}

class UIPrinter: Printer {
    func print(data: Data) {
        // print to UI
    }
}

class PhysicalPrinter: Printer {
    func print(data: Data) {
        // print to Printer
    }
}

class ShinyDataPrinter {
    func print(data: Data, to printer: Printer) {
        printer.print(data: data)
    }
}
/*:
 Теперь, если нам понадобится добавить еще один способ вывода информации - мы просто создадим новую сущность, которая
 будет этим заниматься (тем самым расширив функционал ShinyDataPrinter, но не изменяя его).

 ---

 [Next](@next)
 */
