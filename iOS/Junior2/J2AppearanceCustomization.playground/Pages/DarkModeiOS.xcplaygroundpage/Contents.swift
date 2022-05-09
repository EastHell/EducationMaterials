import UIKit
/*:
 [Previous](@previous)

 ---

 # Выбор стиля

 ---

 Для того чтобы управлять стилями отдельных `Window`, `UIViewController` или `UIView`, необходимо установить свойству
 `overrideUserInterfaceStyle` нужное значение:
 `light` - для светлого стиля
 `dark` - для темного стиля
 `unspecified` - значение по умолчанию для наследования стиля от родительского объекта
 `Window` -> `UIViewController` -> `UIView`
 */
let view = UIView()
view.overrideUserInterfaceStyle = .dark
/*:
 Так-же можно изменить стиль для дочерних `UIViewController` с помощью метода `setOverrideTraitCollection(_:forChild:)`,
 или использовав свойство `overrideTraitCollection` объекта `UIPresentationController`.
 */
class CustomViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setOverrideTraitCollection(.init(traitsFrom: [traitCollection, .init(userInterfaceStyle: .dark)]),
                                   forChild: .init())

        presentationController?.overrideTraitCollection = .init(userInterfaceStyle: .dark)
    }
}
/*
 Приложения поддерживающие версию iOS 13.0 или выше, автоматически считаются поддерживающими темную и светлую темы. Если
 по какой-то причине необходимо ограничиться только одной, то для этого необходимо указать поддерживаемую тему в ключе
 `UIUserInterfaceStyle` файла `Info.plist`.
 */
