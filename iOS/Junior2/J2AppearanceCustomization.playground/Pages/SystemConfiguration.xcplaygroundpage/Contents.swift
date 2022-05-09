/*:
 [Previous](@previous)

 ---

 # Механизмы конфигурирования внешнего вида системных компонентов

 ---

 Для того чтобы конфигурировать внешний вид системных компонентов, необходимо использовать прокси, получаемый с помощью
 метода `appearance()` класса компонента, который необходимо сконфигурировать.

 - Note:
 Важно отметить, что конфигурация внешнего вида, должна быть пременена прежде, чем вьюшка будет добавлена на экран.
 Для того, чтобы изменилась конфигурация вьюшки, которая уже расположена на экране, необходимо убать ее с экрана и
 добавить ее на экран снова

 ---
 */
import UIKit

let view1: UIView = {
    let view = UIView(frame: .init(origin: .zero, size: .init(width: 128, height: 48)))
    view.backgroundColor = .yellow

    return view
}()

let view2: UIView = {
    let view = UIView(frame: .init(origin: .zero, size: .init(width: 128, height: 48)))
    view.backgroundColor = .red

    return view
}()

UIView.appearance().backgroundColor = .white
UIView.appearance().layer.masksToBounds = true
UIView.appearance().layer.cornerRadius = 12

view1
view2
/*:
 ---

 Из примера можно заметить, что не все свойства вьюшки доступны для модификации. К сожалению не существует официально
 задокументированного способа найти все доступные для модификации свойства всех системных компонентов. Известно лишь, что такие
 свойства необходимо помечать с помощью `UI_APPEARANCE_SELECTOR` что позволяет найти их с помощью скрипта.

     cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS*.sdk/System/Library/Frameworks/UIKit.framework/Headers
     grep UI_APPEARANCE_SELECTOR ./*     | \
     sed 's/NS_AVAILABLE_IOS(.*)//g'     | \
     sed 's/NS_DEPRECATED_IOS(.*)//g'    | \
     sed 's/API_AVAILABLE(.*)//g'        | \
     sed 's/API_UNAVAILABLE(.*)//g'      | \
     sed 's/UI_APPEARANCE_SELECTOR//g'   | \
     sed 's/__TVOS_PROHIBITED//g'        | \
     sed 's/@property (/@property(/g'    | \
     awk -F"\.h:"                          \
         'BEGIN {
             print "# UIAppearance Selectors\n"
          }
          $1!= header && NR > 1 {
              print "```"
          };
          $1!= header {
              print "\n## " $1 "\n\n```objc"
          };
          header = $1;
          END {
              print "```\n"
          }'                             | \
     sed 's/## .\//## /g'                | \
     sed 's/.*\.h://g'                   | \
     sed 's/[ ]\{2,\}/ /g'               | \
     sed 's/[ ]*;/;/g'                   | \
     sed 's/ \/\/.*$//'

 ---

 [Source](https://gist.github.com/mattt/5135521)

 ---

 [Next](@next)
 */*/
