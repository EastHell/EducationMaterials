/*:
 [Previous](@previous)

 ---

 # Proxy (Заместитель)

 ---

 Заместитель - это паттерн, который позволяет вместо реальных объектов подставлять специальные объекты-заменители. Эти
 объекты перехватывают вызовы к реальному объекту, позволяя сделать что-то до или после передачи вызова оригиналу.
 */
protocol Subject {
    func request()
}

class RealSubject: Subject {
    func request() {
        print("RealSubject: Handling request.")
    }
}

class Proxy: Subject {
    private var realSubject: RealSubject

    init(_ realSubject: RealSubject) {
        self.realSubject = realSubject
    }

    func request() {
        if (checkAccess()) {
            realSubject.request()
            logAccess()
        }
    }

    private func checkAccess() -> Bool {
        print("Proxy: Checking access prior to firing a real request.")

        return true
    }

    private func logAccess() {
        print("Proxy: Logging the time of request.")
    }
}

func someAction(subject: Subject) {
    print(subject.request())
}

let realSubject = RealSubject()
someAction(subject: realSubject)

let proxy = Proxy(realSubject)
someAction(subject: proxy)
/*:
 Есть несколько вариаций данного паттерна, со своими особенностями.

 Ленивая реализация откладывает загрузку тяжелого объекта до реальной необходимости.

 Защищающая реализация позволяет ограничить доступ к реальному объекту для неавторизованных пользователей.

 Удаленная реализация позволяет транслировать запросы клиента по сети в протоколе понятном удаленному сервису.

 Логирующая реализация позволяет хранить историю обращений к объекту.

 Кеширующая реализация, как понятно из названия кеширует результаты запросов и может выдвать закешированные результаты, вместо
 повторого выполнения запроса.

 Преимущества:
 - Позволяет контроллировать сервисный объект незаметно для клиента
 - Может работать, даже если сервисный объект еще не создан
 - Может контроллировать жизненный цикл служебного объекта

 Недостатки:
 - Усложняет код из за введения допольнительных классов
 - Увеличивает время отклика от сервиса
 ---

 [Next](@next)
 */
