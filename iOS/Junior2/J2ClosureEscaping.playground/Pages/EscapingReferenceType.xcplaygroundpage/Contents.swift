/*:
 [Previous](@previous)
 
 [Каким образом захватывается переменная если **closure**](EscapingValueType)

 # Каким образом захватывается переменная если **closure**:
 # `escaping`, переменная **reference type**

 В случае с **reference type**, при захвате ссылки на `self` в `escaping` **closure**, всегда необходимо явно указывать
 `self` при использовании. А так-же необходимо быть внимательным поскольку `self` захватывается сильной ссылкой есть
 вероятность создать **reference cycle**.

 Для избежания **reference cycle**, необходимо явно захватить `self` слабой ссылкой.
 */
var escapingClosure: (() -> ())? = nil

func testEscaping(closure: @escaping () -> ()) {
    escapingClosure = closure
}

func callEscapingClosure() {
    escapingClosure?()
    escapingClosure = nil
}

class TestReferenceType {
    var testValue = 1

    func firstTestFunc() {
        testEscaping {
            // Потенциальная ошибка, возможно будет создан reference cycle
            self.testValue += 10
            print(self.testValue)
        }
    }

    func secondTestFunc() {
        // Ошибки нет т.к. self захвачен по слабой ссылке
        testEscaping { [weak self] in
            guard let self = self else {
                return
            }

            self.testValue += 100
            print(self.testValue)
        }
    }
}
//: [Next](@next)
