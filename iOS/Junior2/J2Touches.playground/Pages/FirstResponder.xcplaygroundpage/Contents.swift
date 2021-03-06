/*:
 [Previous](@previous)

 ---

 # Определение `first responder` объекта.

 ---

 `UIKit` определяет `first responder` объект на основе типа события.
 - Так для события прикосновeния `first responder` будет - `view` в котором произошло касание.
 - Для события нажатия - объект находящийся в фокусе.
 - Для встряхивания - объект назначенный `UIKit` или разработчиком.
 - Для событие удаленного управления - объект назначенный `UIKit` или разработчиком.
 - Для сообщений меню редактирования - объект назначенный `UIKit` или разработчиком.

 - Note:
 События движения связанные с акселерометром, гироскопом и магнитометром, не следуют по цепочке `responder`, вместо этого
 их обработкой занимается назначеный для этого объект.

 Элементы управления напрямую взаимодействуют со связанными объектами посредством сообщения о действиях. Сообщение о действии
 не является событием, но они все-же могут использовать `responder` цепочку. Когда связынный с элементом управления
 объект оказывается `nil`, `UIKit` проходится по цепочке `responder` пока не найдет объект, который реализует нужный метод.
 Например такими методами могут быть `cut(_:)`, `copy(_:)`, `paste(_:)` для элемента редактирования.

 Так-же есть распознаватели жестов (`GestureRecongnizer`). Они обрабатывают события касания и нажатия, до того,
 как эти события будут обработаны `view`. Если `GestureRecongnizer` не смог распознать жест, `UIKit` отправляет событие
 во `view`. Если `view` не обрабатывает событие, то оно передается дальше по цепочке `responder`.

 ---

 [Next](@next)
 */
