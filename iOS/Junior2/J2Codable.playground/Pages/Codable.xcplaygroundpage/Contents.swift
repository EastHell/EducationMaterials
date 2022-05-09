/*:
 # `Codable` junior 2

 Вопросы:

 - [Как добавить поддержку `Codable` в произвольном типе данных?](CustomTypeCodable)
 - [Что делать, если название свойств не совпадает с названием в **JSON**?](PropertiesNames)
 - [Как трансформировать тип данных при декодировании?](TypeCastingCodable)

 [Неочевидные моменты](Notes)
 [Еще неочевидные моменты](Notes)

 # Немного о `Codable`

 Протокол `Codable` помогает сделать объекты сериализумемыми и десерализуемыми.

 **Сериализация** - это процесс перевода объекта в определенную последовательность байт (например в формат **JSON** или **XML**).
 Cуществует так-же обратный процесс - **десериализация**.

 `Codable` - на самом деле `typealias` объединения протоколов `Encodable` и `Decodable`

 `public typealias Codable = Decodable & Encodable`

 `Encodable` - подсказывает как сериализовать объект. `Decodable` - как его десериализовать.

 [Next](@next)
 */
