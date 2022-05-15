/*:
 [Previous](@previous)

 ---

 # Builder (Строитель)

 ---

 Строитель - паттерн, предоставляющий способ создания составного объекта (Product1, Product2).
 */
class Product1 {
    private var parts = [String]()

    func add(part: String) {
        parts.append(part)
    }

    func listParts() -> String {
        "Product parts: " + parts.joined(separator: ", ") + "\n"
    }
}

protocol Builder {
    func producePartA()
    func producePartB()
    func productPartC()
}

class ConcreteBuilder1: Builder {
    private var product = Product1()

    func reset() {
        product = Product1()
    }

    func producePartA() {
        product.add(part: "PartA1")
    }

    func producePartB() {
        product.add(part: "PartB1")
    }

    func productPartC() {
        product.add(part: "PartC1")
    }

    func getResult() -> Product1 {
        let result = product
        reset()

        return result
    }
}

class Director {
    private var builder: Builder?

    func update(builder: Builder) {
        self.builder = builder
    }

    func buildMinimalViableProduct() {
        builder?.producePartA()
    }

    func buildFullFeaturedProduct() {
        builder?.producePartA()
        builder?.producePartB()
        builder?.productPartC()
    }
}

class Client {
    static func doClientCode(director: Director) {
        let builder = ConcreteBuilder1()
        director.update(builder: builder)

        print("Standard basic product:")
        director.buildMinimalViableProduct()
        print(builder.getResult().listParts())

        print("Standard full featured product:")
        director.buildFullFeaturedProduct()
        print(builder.getResult().listParts())

        print("Custom product:")
        builder.producePartA()
        builder.productPartC()
        print(builder.getResult().listParts())
    }
}

let director = Director()
Client.doClientCode(director: director)
/*:
 Отедяет конструирование сложного объекта от его представления так, что в результате одного и того-же процесса конструироваия
 могут получаться разные представления.

 Достоинства:
 - Повозляет изменять внутрнее представление продукта
 - Изолирует код, реализующий конструирование и представление
 - Дает более тонкий контроль над процессом констурирования

 Недостатки:
 - Алгоритм создания сложного объекта не должен зависеть от того, из каких частей состоит объект и как они стыкуются между
 собой
 - Процесс конструирования должен обеспечивать различные представления конструируемого объекта
 
 ---

 [Next](@next)
 */
