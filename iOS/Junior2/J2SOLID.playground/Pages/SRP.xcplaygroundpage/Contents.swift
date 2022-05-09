/*:
 [Previous](@previous)

 ---

 # SRP

 ---

 * Callout(Смысл):
 Необходимо сделать так чтобы объект не был перегружен лишней логикой, и справлялся только с одной конкретной задачей,
 а так-же был универсален при решении этой задачи.

 1. В объекте, содержащем в себе избыточную логику, при модификации одного функионала может быть задета работа другого.
 Что повлечет за собой неожиданное поведение в местах, которые казалось бы не были связаны с изменениями.
 2. Любой сложный объект должен быть разбит на несколько составляющих, решающих свою конкретную задачу объектов.
 3. Множество объектов решающих схожую задачу, могут быть объединены в один объект.
 */
class DataManager {
    var data: String = ""

    func doWhatYouShoudDo() {
        loadData()
        printData()
        saveData()
    }

    func loadData() {
        // Логика по загрузке данных
    }

    func printData() {
        // Логика по отображению данных
    }

    func getData() -> String {
        // Логика по передаче данных
        return data
    }

    func saveData() {
        // Логика по сохранению данных
    }
}

/*:

 Если мы поправим логику `loadData()`, это может непредсказуемо повлиять на результат работы методов `printData` и `saveData`,
 что может привести к неожиданным последствиям

 ---
 */

class DataLoader {
    func loadData() -> String {
        // Логика по загрузке данных
        return "Some data"
    }
}

class DataPrinter {
    func printData(_ data: String) {
        // Логика по отображению данных
    }
}

class DataSaver {
    func saveData(_ data: String) {
        // Логика по сохранению данных
    }
}

class DataHandler {
    let loader: DataLoader
    let printer: DataPrinter
    let saver: DataSaver

    var data: String = ""

    init(loader: DataLoader, printer: DataPrinter, saver: DataSaver) {
        self.loader = loader
        self.printer = printer
        self.saver = saver
    }

    func doWhatYouShoudDo() {
        data = loader.loadData()
        printer.printData(data)
        saver.saveData(data)
    }

    func getData() -> String {
        // Логика по передаче данных
        return data
    }
}
/*:
 Если теперь поправить логику `loadData()` объекта `DataLoader`, то это никак не отразится на методах `printData` и `saveData`.

 ---

 [Next](@next)
 */
