/*:

 # Какие типы инициализаторов существуют в Swift?

 ---

 В Swift существует 2 типа инициализаторов
 */
class Example {
    let value: Int

/*:
 ---

 Designated initializer
*/
    init(value: Int) {
        self.value = value
    }
/*:
 ---

 Convenience initializer
 */
    convenience init() {
        self.init(value: 10)
    }
}
/*:
 ---

 [Next](@next)
 */
