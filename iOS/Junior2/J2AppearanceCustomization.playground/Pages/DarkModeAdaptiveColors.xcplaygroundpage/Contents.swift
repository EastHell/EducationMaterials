import UIKit
/*:
 [Previous](@previous)

 ---

 # Адаптивные цвета

 ---

 Первое о чем нужно позаботиться - это цвета. Необходимо использовать адаптивные цвета в UI.

 Есть 2 способа этого добиться.

 1. Необходимо использовать семантические цвета вместо фиксированных цветов.
 */
let label = UILabel(frame: .init(origin: .zero, size: .init(width: 128, height: 32)))
label.text = "Hello world"
label.backgroundColor = .systemBackground
label.textColor = .label
label.overrideUserInterfaceStyle = .dark
label.textColor = .secondaryLabel
label.textColor = .tertiaryLabel
label.textColor = .quaternaryLabel
/*:
 2. Если нужны определенные цвета - необходимо определить их в каталоге ресурсов, при этом не забыв определить цвета
 для разных тем. Или использовать новый инициализатор `UIColor(dynamicProvider:)`.
 */
extension UIColor {
    static let defaultTextColor = UIColor {
        switch $0.userInterfaceStyle {
        case .dark:
            return .yellow
        case .light, .unspecified:
            return .blue
        }
    }
}

label.textColor = .defaultTextColor
label.overrideUserInterfaceStyle = .light
/*:
 ---

 [Next](@next)
 */
