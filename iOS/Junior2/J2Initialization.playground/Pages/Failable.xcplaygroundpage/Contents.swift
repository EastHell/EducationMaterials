/*:

 # Failable инициализатор

 ---

 Failable иницилазатор - это инициализатор, процесс работы которого может завершиться неудачей. При использовании
 таких инициализаторов, будет создаваться объект с `optional` типом. И в случае неудачи будет содержать nil.

 - Note:
    Failable, как и `required` можно использовать в любых инициализаторах, а так-же использовать вместе.
 */
class A {
    let value: Int

    required init?(value: Int) {
        guard value > 10 else {
            return nil
        }

        self.value = value
    }

    required convenience init?(value: String) {
        guard let value = Int(value) else {
            return nil
        }

        self.init(value: value)
    }
}

A(value: 3)
/*:
 ---

 [Next](@next)
 */
