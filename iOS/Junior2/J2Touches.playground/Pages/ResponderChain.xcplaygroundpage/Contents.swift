/*:
 [Previous](@previous)

 ---

 # Responder chain

 ---

 Цепочку `responder` объектов, можно перенаправить изменив значение свойства `next` у `responder` объекта. Когда это
 происходит, следующим `responder` будет указанный в `next` объект.

 Многие классы `UIKit` уже изменяют это значение и возвращают определенные объекты, включая:
 - `UIView` объекты. Если `UIView` это корневая `view` у `view controller`, следующим `responder` будет `view controller`.
 Иначе, следующим `responder` будет ее `superview`.
 - `UIViewController` объекты.
    - Если `view` у `view controller` это корневая `view` для `window`, следующим `responder` будет объект `window`.
    - Если `view controller` был показан другим `view controller`, следующим `responder` будет показывающий `view controller`.
 - `UIWindow` объекты. У `window` следующим `responder` является `UIApplication` объект.
 - `UIApplication` объекты. Следующим `responder` является `app delegate`, но только, если `app delegate` является
 `UIResponder` объектом, а не `view`, `view controller` или самим `app` объектом.

 ---

 [Next](@next)
 */
