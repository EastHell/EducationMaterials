/*:
 [Previous](@previous)

 [Codable](Codable)

 - Note:
 Если пропустить один из кейсов `enum` `CodingKeys`, то в процессе сериализации это свойство не будет учитываться,
 но для десериализации необходимо будет установить значение этого свойства по умолчанию
 */

import Foundation

struct CustomType: Codable {
    let someInt: Int
    let someString = "AbraCarabra"

    enum CodingKeys: CodingKey {
        case someInt
    }
}

// Объект для десериализации
let json = """
{
    "someInt": 3
}
""".data(using: .utf8)!

// Создает десериализатор
let decoder = JSONDecoder()

// Десериализует в объект Swift
if let customTypeVariable = try? decoder.decode(CustomType.self, from: json) {
    print(customTypeVariable)
} else {
    print("Decoding error")
}

// Объект для сериализации
let customTypeVariable = CustomType(someInt: 42)

// Создает сериализатор
let encoder = JSONEncoder()

// Сериализует в объет JSON
if let data = try? encoder.encode(customTypeVariable),
   let string = String(data: data, encoding: .utf8) {
    print(string)
} else {
    print("Encoding error")
}

/*:
 - Note:
 Протокол `Codable` наследуется, но методы `encode(to encoder: Encoder) throws` и `init(from decoder: Decoder) throws`
 придется переопределить, как и создать `enum` с ключами для сериализации подкласса
 */

class FirstClass: Codable {
    let someInt: Int

    init(someInt: Int) {
        self.someInt = someInt
    }
}

class SecondClass: FirstClass {
    let someString: String

    init(someString: String, someInt: Int) {
        self.someString = someString

        super.init(someInt: someInt)
    }

    enum CodingKeys: CodingKey {
        case someString
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        someString = try container.decode(String.self, forKey: .someString)

        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(someString, forKey: .someString)

        try super.encode(to: encoder)
    }
}

// Объект для десериализации
let inheritanceJSON = """
{
    "someInt": 3,
    "someString": "AbraCadabra"
}
""".data(using: .utf8)!

// Десериализует в объект Swift
if let secondClassVariable = try? decoder.decode(SecondClass.self, from: inheritanceJSON) {
    print("secondClassVariable:\nsomeString = \(secondClassVariable.someString)\nsomeInt = \(secondClassVariable.someInt)")
} else {
    print("Decoding error")
}

// Объект для сериализации
let secondClassVariable = SecondClass(someString: "RED GOEZ FASTA!", someInt: 4)

// Сериализует в объет JSON
if let data = try? encoder.encode(secondClassVariable),
   let string = String(data: data, encoding: .utf8) {
    print(string)
} else {
    print("Encoding error")
}
