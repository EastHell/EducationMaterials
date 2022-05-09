/*:
 [Previous](@previous)

 ---
 
 # IUO

 ---

 Implicitly unwrapped optionals - это опционалы, которые автоматически распаковываются при необходимости. Чтобы создать IUO
 необходимо поставить `!` после имени типа.
 */
let value: Int!
// value будет иметь тип Optional<Int>
print(type(of: value))
/*:
 ---

 [Next](@next)
 */
