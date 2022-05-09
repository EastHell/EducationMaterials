/*:
 [Previous](@previous)

 ---

 # В каких случаях необходимо применять IUO?

 ---

 Вообще IUO используется достаточно редко, в документации Swift говорится о том, что использовать IUO можно, когда
 вы точно уверены, что к моменту их использования они не будут `nil`. По факту IUO можно увидеть при использовании
 `IBOutlet`, поскольку в момент инициализации класса мы не знаем значения вью, но к моменту использования оно точно
 будет не `nil`. И единственная причина использования IUO в `IBOutlet` - это удобство. На самом же деле, можно абсолютно
 с таким-же результатом использовать просто опционалы. Использование IUO вместо простых опционалов - это размен
 безопасности на удобство. В целом исользование IUO в остальных случаях - не безопасно, поскольку код всегда меняется, и нет
 гарантий что эти изменения не приведут к поведению, когда в момент использования IUO они окажутся `nil`.
 */
import UIKit

class ViewController: UIViewController {
    @IBOutlet var someLabel: UILabel!

    // Other realization
}