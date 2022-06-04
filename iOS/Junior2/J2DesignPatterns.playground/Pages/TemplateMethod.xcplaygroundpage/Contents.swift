/*:
 [Previous](@previous)

 ---

 # Template method (Шаблонный метод)

 ---

 Шаблонный метод - паттерн, который определяет скелет алгоритма, перекладывая ответственность за некоторые его шаги на
 подклассы. Паттер позволяет подклассам переопределять шаги алгоритма, не меняя его общей структуры.
 */
protocol AbstractProtocol {
    func templateMethod()
    func baseOperation1()
    func baseOperation2()
    func baseOperation3()
    func requiredOperations1()
    func requiredOperation2()
    func hook1()
    func hook2()
}

extension AbstractProtocol {
    func templateMethod() {
        baseOperation1()
        requiredOperations1()
        baseOperation2()
        hook1()
        requiredOperation2()
        baseOperation3()
        hook2()
    }

    func baseOperation1() {
        print("AbstractProtocol says: I am doing the bulk of the work\n")
    }

    func baseOperation2() {
        print("AbstractProtocl says: But I let subclasses override some operations\n")
    }

    func baseOperation3() {
        print("AbstractProtocol says: But I am doing the bulk of the work anyway\n")
    }

    func hook1() { }
    func hook2() { }
}

class ConcreteClass1: AbstractProtocol {
    func requiredOperations1() {
        print("ConcreteClass1 says: Implemented Operation1\n")
    }

    func requiredOperation2() {
        print("ConcreteClass1 says: Implemented Operation2\n")
    }

    func hook2() {
        print("ConcreteClass1 says: Overriden Hook2\n")
    }
}

class ConcreteClass2: AbstractProtocol {
    func requiredOperations1() {
        print("ConcreteClass2 says: Implemented Operation1\n")
    }

    func requiredOperation2() {
        print("ConcreteClass2 says: Implemented Operation2\n")
    }

    func hook1() {
        print("ConcreteClass2 says: Overriden Hook1\n")
    }
}

func someCode(use object: AbstractProtocol) {
    object.templateMethod()
}

someCode(use: ConcreteClass1())

print("\nNow using ConcreteClass2\n")

someCode(use: ConcreteClass2())
/*:
 Применяется, когда подклассы должны расширять базовый алгоритм, не меняя его структуры. Когда есть несколько классов,
 делающих одно и то же с незначительными отличиями. Если редакутируется один класс, приходится вносить такие-же правки и в
 остальные классы.

 Преимущества:
 - Облегчает повторное использование кода

 Недостатки:
 - Жесткое ограничение скелетом существующего алгоритма
 - Можно нарушить принцип подстановки Барбары Лисков, изменяя базовое поведение одного из шагов алгоритма через подкласс

 ---

 [Next](@next)
 */
