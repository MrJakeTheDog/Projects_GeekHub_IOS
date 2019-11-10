import Foundation
import PlaygroundSupport
/*
 1 Use and understand Swift's basic types like Bool, Int, String, and Double
 Створіть константи із вказаними значеннями двома способами (явно вказуючи тип і неявно)
 Перевірте себе функцією type(of: тут вкажіть назву константи)
 а) ціле число 1
 b) дійсне число 1.0
 с) рядок, що містить фразу Hello world!
 d) рядок, що містить фразу The number is та константу з числом 42
 e) хибне значення
 f) істинне значення
 */

let a: Int = 1
let a1 = 1
type(of: a)
type(of: a1)

let d: Double = 1.0
let d1 = 1.0
type(of: d)
type(of: d1)

let s: String = "Hello world!"
let s1 = "Hello world!"
type(of: s)
type(of: s1)

let const = 42;
let c: String = "The number is " + String(const)
type(of: c)


let e: Bool = false
let e1 = false
type(of: e)
type(of: e1)

let f: Bool = true
let f1 = true
type(of: f)
type(of: f1)

/*
 2 Declare and use variables and constants (var let)
 a) Зробіть константу цілого типу зі значенням 3
 b) Зробіть змінну типу рядок зі значенням "The three is "
 c) Змініть значення змінної на таке, що містить раніше створену константу
 */

let num: Int = 3
var st: String = "The three is "
st = String(num)

/*
 3 Handle flow control and looping constructs (if for while switch)
 a) Створіть розгалуження яке до змінної b додасть число 1 якщо b додатнє і відніме - якщо від'ємне
 b) Пройдіть циклом по числам від 1 до 10 і виведіть їх (використайте спочатку for потім while)
 c) Використайте switch із цілочисельною змінною який виведе фразу "Low" для значень від 1 до 18, "High" для 19-36, "Zero" для 0 та "Unknown" для решти значень
 */
var b = 23
if b >= 0 {
    b += 1
}
else {
    b -= 1
}

for index in 1...10 {
    index
}

var i = 1
while i <= 10 {
    i
    i+=1;
}

switch b{
case 1...18:
    "Low"
case 19...36:
    "High"
case 0:
    "Zero"
default:
    "Unknow"
}

/*
 4 Create and use collections (Array Set Dictionary)
 a) Створіть масив (Array) цілих чисел та посортуйте його
 b) Створіть дві множини (Set) цілих чисел та знайдіть їх перетин
 с) Створіть Dictionary в якому ключем виступає рядок а значенням будь-який тип і заповніть його
 */

var intArray = [2,5,1,8,3,9,4,0,7,6]

var intSortedArray = intArray.sorted()
intSortedArray

let aSet: Set = [2,5,1,12,7,6]
let bSet: Set = [5,0,2,1,7,23,6]

aSet.intersection(bSet)

var dictionary = ["One":1,"Two":2,"Five":5,"Seven":7]

/*
 5 Develop and use simple functions ( inout ->  )
 а) Створіть функцію яка приймає на вхід масив і віддає найчастіше повторюване значення в ньому
 b) Створіть функцію яка приймає на вхід масив і змінює його ж, додаючи до кожного значення 1
 */

func arrayElement (_ arr: [Int]) -> (numberOfMaxCount: Int, maxOfNumberCount: Int) {
    var num = arr[0], maxOfCount = 1, count: Int, k: Int;
    for index in 0...arr.count-2 {
        count = 1
        k = index + 1
        for index1 in k...arr.count-1 {
            if arr[index] == arr[index1] {
            count += 1
            }
        }
        if count > maxOfCount {
            maxOfCount = count
            num = arr[index]
        }
    }
    return (numberOfMaxCount: num, maxOfNumberCount: maxOfCount);
}

var array = [1,2,1,5,8,3,4,5,5,3,5]
var maxOfNumberReapet = arrayElement(array);
maxOfNumberReapet.numberOfMaxCount
maxOfNumberReapet.maxOfNumberCount

"Number " + String(maxOfNumberReapet.numberOfMaxCount) + " meets " + String(maxOfNumberReapet.maxOfNumberCount) + " times."

func arrayIncrement (_ arr: inout [Int]) {
    for index in 0..<arr.count {
        arr[index]+=1
    }
}

arrayIncrement(&array)

/*
 6-7 Cast objects safely from one type to another ( as! as? as init). Handle optionals and unwrap them safely (if let ; guard let ; != nil)
 Створіть функцію яка приймає на вхід змінну типу Any? і перевіряє тип значення на String, Int, Double, Float та інші базові типи.
 Результат виконання функції - рядок з відповідним типом або "Unknown type" якщо визначити тип не вдалось.
 (!) Для виконання цього завдання НЕ використовуйте метод type(of: ).
 (!!) Для виконання цього завдання МОЖНА використовувати наступні конструкції (спробуйте кожну з них в окремії функції)
 a) `if let`
 b) switch.
 */

var any: Any?
any = "Jorney"

func showType (_ an: Any?) {
    if let a = an as? String {
        a
        "Varible is String"
    }
    else if let a = an as? Int {
        a
        "Varible is Int"
    }
    else if let a = an as? Double {
        a
        "Varible is Double"
    }
    else if let a = an as? Float {
        a
        "Varible is Float"
    }
    else if let a = an as? Bool {
        a
        "Varible is Bool"
    }
    else {
        "Unknow type"
    }
}

showType(any)

func showType1 (_ ann: Any?) {
    switch ann{
    case is String:
        "Varible is String"
    case is Int:
        "Varible is Int"
    case is Double:
        "Varible is Double"
    case is Float:
        "Varible is Float"
    case is Bool:
        "Varible is Bool"
    default:
        print("Unknow type")
    }
}

showType1(any)
