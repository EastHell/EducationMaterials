import UIKit
/*:
 [Previous](@previous)

 ---

 # Визуальные эффекты

 ---

 Так-же необходимо позаботиться об адаптивных стилях эффектов.
 */
class CustomView: UIView {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        imageView.image = .init(named: traitCollection.userInterfaceStyle == .dark ? "wallpaper.jpeg" : "wallpaperLight.jpeg")
    }

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    let blurEffectView: UIVisualEffectView = {
        let effectView = UIVisualEffectView()
        effectView.effect = UIBlurEffect(style: .regular)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 16

        return effectView
    }()

    let vibrancyEffectView: UIVisualEffectView = {
        let effectView = UIVisualEffectView()
        effectView.effect = UIVibrancyEffect(blurEffect: .init(style: .regular), style: .label)
        effectView.translatesAutoresizingMaskIntoConstraints = false

        return effectView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 64)
        label.text = "Hello world"
        label.textAlignment = .center

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(imageView)
        imageView.addSubview(blurEffectView)
        blurEffectView.contentView.addSubview(vibrancyEffectView)
        vibrancyEffectView.contentView.addSubview(label)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            blurEffectView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blurEffectView.centerYAnchor.constraint(equalTo: centerYAnchor),
            blurEffectView.widthAnchor.constraint(equalToConstant: 384),
            blurEffectView.heightAnchor.constraint(equalToConstant: 384),

            vibrancyEffectView.topAnchor.constraint(equalTo: blurEffectView.topAnchor),
            vibrancyEffectView.leadingAnchor.constraint(equalTo: blurEffectView.leadingAnchor),
            vibrancyEffectView.trailingAnchor.constraint(equalTo: blurEffectView.trailingAnchor),
            vibrancyEffectView.bottomAnchor.constraint(equalTo: blurEffectView.bottomAnchor),

            label.centerYAnchor.constraint(equalTo: vibrancyEffectView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: vibrancyEffectView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: vibrancyEffectView.trailingAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

let view = CustomView(frame: .init(origin: .zero, size: .init(width: 512, height: 512)))
view.overrideUserInterfaceStyle = .dark
/*:
 ---

 [Next](@next)
 */
