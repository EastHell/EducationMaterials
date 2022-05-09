/*:
 [Previous](@previous)

 ---

 # `UI*Appearance classes`

 ---

 `UI*Appearance` классы помогают сконфигурировать внешний вид различных баров и их элементов для разных режимов отображения

     UINavigationBarAppearance
     UIToolbarAppearance
     UITabBarAppearance
     UITabBarItemAppearance
     UITabBarItemStateAppearance
     UIBarAppearance
     UIBarButtonItemAppearance
     UIBarButtonItemStateAppearance

 Их так-же можно применить ко всему приложению, через прокси.
 */
import UIKit

// Создает конфигурацию внешнего вида
let customAppearance = UINavigationBarAppearance(idiom: .phone)
customAppearance.backgroundColor = .yellow
customAppearance.shadowColor = .darkGray
customAppearance.titleTextAttributes[NSAttributedString.Key.foregroundColor] = UIColor.green

// Применяет созданный `appearance` для `standardAppearance` режима, класса `UINavigationBar`
let appearance = UINavigationBar.appearance()
appearance.standardAppearance = customAppearance
/*:
 ---

 [Next](@next)
 */
