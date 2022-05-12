/*:
 [Previous](@previous)

 ---

 # UIResponder

 ---

 Приложение получает и обрабатывает события используя `responder` объекты. `responder` объекты - это любые экземлпяры класса
 `UIResponder`. `UIView`, `UIViewController` и `UIApplication` являются наследниками `UIResponder`. `responder` получая
 событие, должны либо обработать его, либо отправить следующему `responder` объекту. Когда приложение получает событие,
 `UIKit` автоматически направляет это событие на обработку самому подходящему `responder` объекту, называемому так-же
 `first responder`.

 Необработанные события передаются от `responder` к `responder` по активной цепочке `responder` объектов приложения.

 ![ResponderChain](ResponderChain.png)

 [Список методов для обработки событий](https://developer.apple.com/documentation/uikit/uiresponder)

 ---

 [Next](@next)
 */
