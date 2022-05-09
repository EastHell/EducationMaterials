/*:
 [Previous](@previous)

 [Codable](Codable)

 # Как добавить поддержку `Codable` в произвольном типе данных?

 Для того чтобы добавить поддержку `Codable` в произвольном типе данных, необходимо просто реализовать протокол `Codable`.

 Для этого произвольный тип должен реализовать метод `encode(to encoder: Encoder) throws` протокола `Encodable` и метод
 `init(from decoder: Decoder) throws` протокола `Decodable`.
 */

class CustomType: Codable {
    let someInt: Int

    enum CodingKeys: CodingKey {
        case someInt
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        someInt = try container.decode(Int.self, forKey: .someInt)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(someInt, forKey: .someInt)
    }
}

/*:
 Некоторые стандартные типы уже реализуют протокол `Codable`

 Например: `String`, `Int`, `Double`, `Bool`

 Так-же протокол `Codable` реализуют некоторые типы `Foundation`: `Date`, `Data`, `URL`

 А еще проткоол `Codable` реализуют коллекции: массивы, словари

 А так-же опционалы.

 - Note:
 Стоит отметить, что, если все свойства произвольного типа уже реализуют протокол `Codable`,
 то реализовывать методы `init` и `encode` не обязательно
 */

import Foundation

class CustomTypeTwo: Codable {
    let someCustonType: CustomType
    let someString: String
    let someInt: Int
    let someDouble: Double
    let someBool: Bool
    let someDate: Date
    let someData: Data
    let someURL: URL
    let someArray: [Int]
    let someDictionary: [String: Int]
    let someOptional: Int?
}

/*:
 `enum` так-же может быть `Codable`, для этого достаточно указать `Int` или `String` в качестве его `raw` значений.
 */

enum CustomEnum: Int, Codable {
    case firstCase
    case secondCase
}

enum SecondCustomEnum: String, Codable {
    case firstCase
    case secondCase
}

//: [Next](@next)
