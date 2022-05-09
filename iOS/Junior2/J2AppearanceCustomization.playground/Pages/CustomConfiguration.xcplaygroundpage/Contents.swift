/*:
 [Previous](@previous)

 ---

 # Механизмы конфигурирования внешнего вида кастомных компонентов

 ---

 Для того чтобы конфигурировать внешний вид кастомных компонентов, необходимо чтобы кастомный компонент реализовывал
 протоколы `UIAppearance` и `UIAppearanceContainer`, благо оба этих протокола конформятся в `UIView` из коробки.

 Так-же необходимо обозначить методы и свойства отвечающие за кастомизацию с помощью ключевых слов `@objc dynamic`.

 Далее процесс самой кастомизация аналогичен процессу с системными компонентами.
 */
import UIKit

class NextButton: UIButton {
    private let buttonImageView: UIImageView = {
        let image = UIImage(systemName: "person.circle")
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    /// Пример свойства отвечающего за кастомизацию
    @objc dynamic var buttonImage: UIImage? {
        get {
            buttonImageView.image
        }
        set {
            buttonImageView.image = newValue
        }
    }

    /// Пример методов отвечающих за кастомизацию
    @objc dynamic func buttonImage(for state: UIControl.State) -> UIImage? {
        // some implementation
        nil
    }

    @objc dynamic func setButton(_ image: UIImage?, forState state: UIControl.State) {
        // some implementation
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(buttonImageView)

        backgroundColor = .white

        NSLayoutConstraint.activate([
            buttonImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonImageView.topAnchor.constraint(equalTo: topAnchor),
            buttonImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

let button = NextButton(frame: .init(origin: .zero, size: .init(width: 64, height: 64)))

NextButton.appearance().buttonImage = .init(systemName: "person.circle.fill")

button
/*:
 ---

 [Next](@next)
 */
