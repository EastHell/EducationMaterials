import UIKit
/*:
 [Previous](@previous)

 ---

 # Flyweight (Легковес)

 ---

 Легковес - это паттерн, который позволяет вместить большее количество объектов в отведенную оперативную память.
 Легковес экономит память, разделяя общее состояние объектов между собой, вместо хранения одинаковых данных в каждом
 объекте.
 */
let color0 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
let color1 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
/*:
 Получили два разных объекта
 */
color0 === color1

class ColorFactory {
    var colorStore: [String: UIColor] = [:]

    func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"

        if let color = colorStore[key] {
            return color
        }

        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        colorStore[key] = color

        return color
    }
}

let factory = ColorFactory()

let color2 = factory.rgba(1, 0, 0, 1)
let color3 = factory.rgba(1, 0, 0, 1)
/*:
 Получили один и тот-же объект
 */
color2 === color3
/*:
 Применяется, когда необходимо сократить использование оперативной памяти, когда вместо создания нескольких экземпляров
 одного и того-же объекта, можно обойтись одним.

 Преимущества:
 - Экономит оперативную память

 Недостатки:
 - Расходует ресурсы на поиск объекта и вычисление хеша
 - Усложняет код, вводя дополнительные классы
 ---

 [Next](@next)
 */
