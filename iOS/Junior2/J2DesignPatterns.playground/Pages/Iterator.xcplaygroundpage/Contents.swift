/*:
 [Previous](@previous)

 ---

 # Iterator (Итератор)

 ---

 Итератор - паттерн, который дает возможность последовательно обходить элементы составных объектов, не раскрывая их
 внутреннего представления.
 */
class WordsCollection {
    var items = [String]()

    func append(_ item: String) {
        self.items.append(item)
    }
}

class WordsIterator: IteratorProtocol {
    private let collection: WordsCollection
    private var index = 0

    init(_ collection: WordsCollection) {
        self.collection = collection
    }

    func next() -> String? {
        let item = index < collection.items.count ? collection.items[index] : nil
        index += 1

        return item
    }
}

extension WordsCollection: Sequence {
    func makeIterator() -> WordsIterator {
        return WordsIterator(self)
    }
}

class NumbersCollection {
    var items = [Int]()

    func append(_ item: Int) {
        self.items.append(item)
    }
}

extension NumbersCollection: Sequence {
    func makeIterator() -> AnyIterator<Int> {
        var index = self.items.count - 1

        return AnyIterator {
            let item = index >= 0 ? self.items[index] : nil
            index += 1

            return item
        }
    }
}

func someCode<S: Sequence>(sequence: S) {
    for item in sequence {
        print(item)
    }
}

let words = WordsCollection()
words.append("First")
words.append("Second")
words.append("Third")

someCode(sequence: words)

let numbers = NumbersCollection()
numbers.append(1)
numbers.append(2)
numbers.append(3)

someCode(sequence: numbers)
/*:
 Применяется, когда есть сложная структура данных, и необходимо скрыть от клиента детали ее реализации (из-за сложности или
 вопросов безопасности). Когда нужно иметь несколько вариантов обхода одной и той-же структуры данных. Когда хочется иметь
 единый интерфейс обхода различных структур данных.

 Преимущества:
 - Упрощает классы хранения данных
 - Позволяет реализаовать различные способы обхода структуры данных
 - Позволяет одновременно перемещаться по структуре данных в разные стороны

 Недостатки:
 - Не оправдан, если можно обойтись простым циклом

 ---

 [Next](@next)
 */
