/*:
 [Previous](@previous)

 [Codable](Codable)

 # Как трансформировать тип данных при декодировании?

 Иногда в объектах **JSON** типы данных не соответствуют тем, которые используюся в коде.
 Например свойство имеющее целочисленный тип, в **JSON** может быть представлено в виде строки.

 Привести свойство в нужный тип можно в реализации методов `encode(to encoder: Encoder) throws` и
 `init(from decoder: Decoder) throws`
*/

struct CustomType: Codable {
    let someInt: Int
}

extension CustomType {
    enum CodingKeys: CodingKey {
        case someInt
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let stringSomeInt = try container.decode(String.self, forKey: .someInt)

        guard let someInt = Int(stringSomeInt) else {
            // Если приведение типа прошло не успешно - выбрасываем исключение
            throw DecodingError.dataCorruptedError(
                forKey: .someInt,
                in: container,
                debugDescription: "Failed to convert an instance of \(Int.self) from \(stringSomeInt)"
            )
        }

        self.someInt = someInt
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        // Поскольку приведение типа в данном случае происходит без ошибки, нет нужды выбрасывать исплючение
        // но при необходимости можно выбросить исключение `EncodingError.invalidValue()`
        try container.encode(String(someInt), forKey: .someInt)
    }
}

//: [Next](@next)
