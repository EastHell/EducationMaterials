/*:
 [Previous](@previous)

 ---

 # `UIAppearance protocol`

 ---

 Протокол `UIAppearance` предоставляет нам доступ к разным видам прокси.

     public protocol UIAppearance : NSObjectProtocol {
         static func appearance() -> Self@available(iOS 9.0, *)
         static func appearance(whenContainedInInstancesOf containerTypes: [UIAppearanceContainer.Type]) -> Self
         @available(iOS 8.0, *)
         static func appearance(for trait: UITraitCollection) -> Self
         @available(iOS 9.0, *)
         static func appearance(for trait: UITraitCollection, whenContainedInInstancesOf containerTypes: [UIAppearanceContainer.Type]) -> Self
     }

 Метод `appearance()` дает доступ к прокси для экземпляров всех классов и подклассов типа, для которого был вызван.
 Метод `appearance(whenContainedInInstancesOf containerTypes:)` дает доступ к прокси для экземпляров всех классов и подклассов
 типа, для которого был вызван, если они лежат в указанных контейнерах.

 И аналогичные методы с `UITraitCollection`, которые дают доступ к прокси для экземпляров классов дополнительно с указанной
 коллекцией признаков.

 ---

 [Next](@next)
 */
