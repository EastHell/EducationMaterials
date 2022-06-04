/*:
 [Previous](@previous)

 ---

 # Strategy (Стратегия)

 ---

 Стратегия - паттерн который определяет семейство схожих алгоритмов и помещает каждый из них в собственный класс. После
 чего алгоритмы можно взаимозаменять прямо во время исполнения программы.
 */
protocol Strategy {
    func execute(a: Int, b: Int) -> Int
}

class ConcreteStrategyAdd: Strategy {
    func execute(a: Int, b: Int) -> Int {
        return a + b
    }
}

class ConcreteStrategySubstract: Strategy {
    func execute(a: Int, b: Int) -> Int {
        return a - b
    }
}

class ConcreteStrategyMultiply: Strategy {
    func execute(a: Int, b: Int) -> Int {
        return a * b
    }
}

class Context {
    private var strategy: Strategy

    init(strategy: Strategy) {
        self.strategy = strategy
    }

    func setStrategy(_ strategy: Strategy) {
        self.strategy = strategy
    }

    func executeStrategy(a: Int, b: Int) -> Int {
        return strategy.execute(a: a, b: b)
    }
}

let strategy = ConcreteStrategyAdd()
let context = Context(strategy: strategy)
context.executeStrategy(a: 5, b: 10)

let substract = ConcreteStrategySubstract()
context.setStrategy(substract)
context.executeStrategy(a: 10, b: 5)

let multiply = ConcreteStrategyMultiply()
context.setStrategy(multiply)
context.executeStrategy(a: 3, b: 5)
/*:
 Применяется когда нужно использовать разные вариации какого-то алгоритма внутри одного объекта. Когда есть множество похожих
 классов, отличающихся только некоторым поведением. Когда не хочется обнажать детали реализации алгоритмов для других классов.
 Когда различные вариации алгоритмов реализованы в виде развеститого условного оператора. Каждая ветка такого оператора
 представляет вариацию алгоритма.

 Преимущества:
 - Горячая замена алгоритмов на лету
 - Изолирует код и данные алгоритмов от остальных классов
 - Уход от наследования к делегированию
 - Реализует принцир открытости/закрытости

 Недостатки:
 - Усложняет программу за счет дополнительных классов
 - Клиент должен знать, в чем разница между стратегиями, чтобы выбрать подходящую

 ---

 [Next](@next)
 */
