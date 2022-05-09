import UIKit
/*:
 [Previous](@previous)

 ---

 # Адаптивные изображения

 ---

 Следующее о чем необходимо позаботиться, после адаптивных цветов - это адаптивные изобрaжния. Здесь так-же есть несколько
 способов добиться необходимого поведения.

 1. Определить в каталоге ресурсов изображения для разных тем. Указав их для Any, Light и Dark настроек `appearance`.
 ![Assets](Assets.png)
 2. Использовать символьные изображения, такие изображения уже адаптированы под разные цветовые настройки.
 */
let imageView = UIImageView(frame: .init(origin: .zero, size: .init(width: 80, height: 64)))
let image = UIImage(systemName: "externaldrive.fill.badge.person.crop")
imageView.backgroundColor = .systemBackground
let configuration = UIImage.SymbolConfiguration(hierarchicalColor: .systemGray)
imageView.preferredSymbolConfiguration = configuration
imageView.image = image
imageView.overrideUserInterfaceStyle = .dark
/*:
 3. Использовать изображения с оттенками, которые, благодаря настройкам прозрачности будут хорошо выглядеть при любых
 цветовых настройках.
 ![Tintable](Tintable.png)

 ---

 [Next](@next)
 */
