/*:
 [Previous](@previous)

 ---

 # Visitor (Посетитель)

 ---

 Посетитель - паттерн, который позволяет создавать новые операции, не меняя классы объектов, над которыми эти операции
 могут выполняться.
 */
protocol Component {
    func accept(_ visitior: Visitor)
}

class ConcreteComponentA: Component {
    func accept(_ visitor: Visitor) {
        visitor.visitConcreteComponentA(element: self)
    }

    func exclusiveMethodOfConcreteComponentA() -> String {
        return "A"
    }
}

class ConcreteComponentB: Component {
    func accept(_ visitor: Visitor) {
        visitor.visitConcreteComponentB(element: self)
    }

    func specialMethodOfConcreteComponentB() -> String {
        return "B"
    }
}

protocol Visitor {
    func visitConcreteComponentA(element: ConcreteComponentA)
    func visitConcreteComponentB(element: ConcreteComponentB)
}

class ConcreteVisitor1: Visitor {
    func visitConcreteComponentA(element: ConcreteComponentA) {
        print(element.exclusiveMethodOfConcreteComponentA() + " + ConcreteVisitor1\n")
    }

    func visitConcreteComponentB(element: ConcreteComponentB) {
        print(element.specialMethodOfConcreteComponentB() + " + ConcreteVisitor1\n")
    }
}

class ConcreteVisitor2: Visitor {
    func visitConcreteComponentA(element: ConcreteComponentA) {
        print(element.exclusiveMethodOfConcreteComponentA() + " + ConcreteVisitor2\n")
    }

    func visitConcreteComponentB(element: ConcreteComponentB) {
        print(element.specialMethodOfConcreteComponentB() + " + ConcreteVisitor2\n")
    }
}

func someCode(components: [Component], visitor: Visitor) {
    components.forEach { $0.accept(visitor) }
}

let components: [Component] = [ConcreteComponentA(), ConcreteComponentB()]
let visitor1 = ConcreteVisitor1()
someCode(components: components, visitor: visitor1)

let visitor2 = ConcreteVisitor2()
someCode(components: components, visitor: visitor2)
/*:
 Применяется, когда нужно выолнить операцию над всеми элементами сложной структуры объектов (например, деревом). Когда над
 объектами сложной структуры объектов надо выполнять некоторые, не связанные между собой операций, но вы не хотите
 "засорять" классы такими операциями. Когда новое поведение имеет смысл только для некоторых классов из существующей
 иерархии.

 Преимущества:
 - Упрощает добавление новых операций над всей связанной структурой объектов
 - Объединяет родственные операции в одном классе
 - Посетитель может накоплять состояние при обходе структуры компонентов

 Недостатки:
 - Паттерн неоправдан, если иерархия компонентов часто меняется
 - Может привести к нарушению инкапсуляции компонентов
 */
