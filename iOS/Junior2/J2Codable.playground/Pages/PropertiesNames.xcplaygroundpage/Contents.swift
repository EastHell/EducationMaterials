/*:
 [Previous](@previous)

 [Codable](Codable)

 # Что делать, если название свойств не совпадает с названием в **JSON**?

 Бывают случаи, когда название полей в json отличаются от названия свойств, которые вы хотите использовать.

 Например в **JSON** свойства могут именоваться используя стиль **snake_case**,
 а свойства в типах **Swift** обычно используют **lowerCamelCase**

 В большинстве случаев, может помочь установка `convertToSnakeCase` для `keyEncodingStrategy` и
 `convertFromSnakeCase` для `keyDecodingStrategy` в encoder и decoder соответственно.
 */

import Foundation

struct OlympicEventResult: Codable {
    var goldWinner: String
    var silverWinner: String
    var bronzeWinner: String
}

// Данные для десериализации
let json = """
{
    "gold_winner": "Light",
    "silver_winner": "Sound",
    "bronze_winner": "Unladen Swallow"
}
""".data(using: .utf8)!

// Создает и конфигурирует декодер
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

// Десериализует данные
if let olympicEventResult = try? decoder.decode(OlympicEventResult.self, from: json) {
    print(olympicEventResult)
} else {
    print("Decoding error")
}

// Данные для сериализации
let olympicEventResult = OlympicEventResult(goldWinner: "Light",
                                            silverWinner: "Sound",
                                            bronzeWinner: "Unladen Swallow")

// Создает и конфигурирует энкодер
let encoder = JSONEncoder()
encoder.keyEncodingStrategy = .convertToSnakeCase

if let encodedData = try? encoder.encode(olympicEventResult),
   let string = String(data: encodedData, encoding: .utf8) {
    print(string)
} else {
    print("Encoding error")
}

/*:
 Так-же иногда необходимо сменить не просто стиль именования полей, а имя свойства целиком.

 Для таких целей в типах реализующих `Codable` есть `enum` `CodingKeys`. Именно в нем задается ассоциативная связь между
 именем свойства в **JSON** и именем свойства в типе **Swift**.

 Все что нам необхоимо - это реализовать `enum` `CodingKeys`, реализующий протокол `CodingKey`, указать `String` в качестве
 его `raw` значений и перечислить все свойства, указав в их `raw` значении имена, которые будут использоваться в
 **JSON**
 */

struct CustomType: Codable {
    let someInt: Int

    enum CodingKeys: String, CodingKey {
        case someInt = "INTVALUE"
    }
}

// Данные для десериализации
let customJsonThree = """
{
    "INTVALUE": 123
}
""".data(using: .utf8)!

if let someCustomTheeVariable = try? decoder.decode(CustomType.self, from: customJsonThree) {
    print(someCustomTheeVariable)
} else {
    print("Decoding error")
}

// Данные для сериализации
let someCustomTheeVariable = CustomType(someInt: 321)

/*:
 - Important:
 Если вы уже изменяли `keyEncodingStrategy` в `encoder` - необходимо вернуть его обратно в `useDefaultKeys`,
 прежде чем сериализовывать данные, иначе результат может оказаться неадекватным
 */

encoder.keyEncodingStrategy = .useDefaultKeys

if let data = try? encoder.encode(someCustomTheeVariable),
   let stringValue = String(data: data, encoding: .utf8) {
    print(stringValue)
} else {
    print("Decoding error")
}

//: [Next](@next)
