/*:
 [Previous](@previous)

 [Codable](Codable)

 # Неочевидные моменты

 - Note:
 `enum` `CodingKeys` на самом деле генерируется автоматически, пока вы его не переопределили
 */

import Foundation

struct CustomType: Codable {
    let someInt: Int
    let someString: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        someInt = try container.decode(Int.self, forKey: .someInt)
        someString = try container.decode(String.self, forKey: .someString)
    }
}

/*:
 - Note:
 `enum` `CodingKeys` перестает генерироваться, если вы определите **оба** метода `encode(to encoder: Encoder) throws` и
 `init(from decoder: Decoder) throws`
 */

struct CustomTypeTwo: Codable {
    let someInt: Int
    let someString: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        someInt = try container.decode(Int.self, forKey: .someInt)
        someString = try container.decode(String.self, forKey: .someString)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(someInt, forKey: .someInt)
        try container.encode(someString, forKey: .someString)
    }
}

/*:
 - Note:
 Если вы будете переопределять методы `encode(to encoder: Encoder) throws` и `init(from decoder: Decoder) throws`,
 можно использовать любое имя для `enum` с ключами для сериализации
 */

struct CustomTypeThree: Codable {
    let someInt: Int
    let someString: String

    enum NotUsualCodingKeys: CodingKey {
        case someInt
        case someString
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NotUsualCodingKeys.self)
        someInt = try container.decode(Int.self, forKey: NotUsualCodingKeys.someInt)
        someString = try container.decode(String.self, forKey: NotUsualCodingKeys.someString)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: NotUsualCodingKeys.self)
        try container.encode(someInt, forKey: NotUsualCodingKeys.someInt)
        try container.encode(someString, forKey: NotUsualCodingKeys.someString)
    }
}

//: [Next](@next)
