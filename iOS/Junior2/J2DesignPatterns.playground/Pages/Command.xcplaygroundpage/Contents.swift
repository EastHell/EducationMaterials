/*:
 [Previous](@previous)

 ---

 # Command (Команда)

 ---

 Команда - паттерн который превращает запросы в объекты, позволяя передавать их как аргументы при вызове методов, ставить
 запросы в очередь, логировать их, а так-же поддерживать отмену сообщений.
 */
protocol Command {
    func execute()
}

class SimpleCommand: Command {
    private var payload: String

    init(_ payload: String) {
        self.payload = payload
    }

    func execute() {
        print("SimpleCommand: See, I can do simple things like printing (" + payload + ")")
    }
}

class Receiver {
    func doSomething(_ a: String) {
        print("Receiver: Working on (" + a + ")\n")
    }

    func doSomethingElse(_ b: String) {
        print("Receiver: Also working on (" + b + ")\n")
    }
}

class ComplexCommand: Command {
    private var receiver: Receiver

    private var a: String
    private var b: String

    init(_ receiver: Receiver, _ a: String, _ b: String) {
        self.receiver = receiver
        self.a = a
        self.b = b
    }

    func execute() {
        print("ComplexCommand: Complex stuff should be done by a receiver object.\n")
        receiver.doSomething(a)
        receiver.doSomethingElse(b)
    }
}

class Invoker {
    private var onStart: Command?
    private var onFinish: Command?

    func setOnStart(_ command: Command) {
        onStart = command
    }

    func setOnFinish(_ command: Command) {
        onFinish = command
    }

    func doSomethingImportant() {
        print("Invoker: Does anybody want something done before I begin?")
        onStart?.execute()
        print("Invoker: ... doing something really important...\nInvoker: Does anybody want something done after I finish?")
        onFinish?.execute()
    }
}

let invoker = Invoker()
invoker.setOnStart(SimpleCommand("Say hi!"))
let receiver = Receiver()
invoker.setOnFinish(ComplexCommand(receiver, "Send email", "Save report"))
invoker.doSomethingImportant()
/*:
 Применяется, когда необходимо параметрезировать объекты выполняемым действием. Когда необходимо ставить операции в очередь,
 выполнять их по расписанию или передавать по сети. Когда нужна операция отмены.

 Преимущества:
 - Убирает прямую зависимость между объектами, вызывающими операции, и объектами, которые их непосредственно выполняют.
 - Позволяет реализовать простую отмену и повтор операций.
 - Позволяет реализовать отложенный запуск операций.
 - Позволяет собирать сложные команды из простых.
 - Реализует принцип открытости/закрытости.

 Недостатки:
 - Усложняет код программы из-за введения множества допольнительных классов.

 ---

 [Next](@next)
 */
