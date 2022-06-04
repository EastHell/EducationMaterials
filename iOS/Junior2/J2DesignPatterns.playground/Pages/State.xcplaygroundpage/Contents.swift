/*:
 [Previous](@previous)

 ---

 # State (Состояние)

 ---

 Состояние - паттерн, который позволяет объектам менять поведение в зависимости от своего состояни. Извне создается
 впечатление, что изменился класс объекта.
 */
class Context {
    private var state: State

    init(_ state: State) {
        self.state = state
        transitionTo(state: state)
    }

    func transitionTo(state: State) {
        print("Context: Transition to " + String(describing: state))
        self.state = state
        self.state.update(context: self)
    }

    func request1() {
        state.handle1()
    }

    func request2() {
        state.handle2()
    }
}

protocol State: AnyObject {
    func update(context: Context)
    func handle1()
    func handle2()
}

class BaseState: State {
    private(set) weak var context: Context?

    func update(context: Context) {
        self.context = context
    }

    func handle1() {}
    func handle2() {}
}

class ConcreteStateA: BaseState {
    override func handle1() {
        print("ConcreteStateA handles request1.")
        print("ConcreteStateA wants to change the state of the context.\n")
        context?.transitionTo(state: ConcreteStateB())
    }

    override func handle2() {
        print("ConcreteStateA handles request2.\n")
    }
}

class ConcreteStateB: BaseState {
    override func handle1() {
        print("ConcreteStateB handles request1.")
    }

    override func handle2() {
        print("ConcreteStateB handles request2.\n")
        print("ConcreteStateB wants to change the state of the context.\n")
        context?.transitionTo(state: ConcreteStateA())
    }
}

let context = Context(ConcreteStateA())
context.request1()
context.request2()
/*:
 Применяется, когда есть объект, поведение которого кардинально меняется в зависимости от внутреннего состояния, причем
 типов состояний много и их код часто меняется. Когда код класса содержит множество больших, похожих друг на друга,
 условных операторов, которые выбирают поведение в зависимости от текущих значений полей класса. Когда сознательно
 используется табличная машина состояний, построенная на условных операторах, но приходится мириться с дублированием кода
 для похожих состояний и переходов.

 Преимущества:
 - Избавляет от множества больших условных операторо машины состояний
 - Концентрирует в одном месте код, связанный с определенным состоянием
 - Упрощает код контекста

 Недостатки:
 - Может неоправданно усложнить код, если состояний мало и они редко меняются
 ---

 [Next](@next)
 */
