import UIKit
/*:
 [Previous](@previous)

 ---

 # Обновление кастомных View.

 ---

 Когда пользователь изменяет системный внешний вид, система автоматически просит все window и view перерисоваться. Во
 время этого процесса система вызвает определенные методы объектов, чтобы в них можно было выполнить код, связанный с
 обновлением внешнего вида.

 `UIView`
 - `traitCollectionDidChange(_:)`
 - `layoutSubviews()`
 - `draw(_:)`
 - `updateConstraints()`
 - `tintColorDidChange()`

 `UIViewController`
 - `traitCollectionDidChange(_:)`
 - `updateViewConstraints()`
 - `viewWillLayoutSubviews()`
 - `viewDidLayoutSubviews()`

 `UIPresentationController`
 - `traitCollectionDidChange(_:)`
 - `containerViewWillLayoutSubviews()`
 - `containerViewDidLayoutSubviews()`

 Например, в этих методах можно изменять цвета `CALayer`, поскольку `cgColor` не умеет адаптироваться под выбранную тему
 самостоятельно.
 */
class CustomView: UIView {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        layer.backgroundColor = UIColor.customBackgroundColor.cgColor
        print("traitCollectionDidChange")
    }
}

let view = CustomView(frame: .init(origin: .zero, size: .init(width: 64, height: 64)))
view.overrideUserInterfaceStyle = .dark
/*:
 Но не стоит добавлять в такие методы ресурсозатратные задачи, эти методы должны отрабатывать максимально быстро.

 ---

 [Next](@next)
 */
