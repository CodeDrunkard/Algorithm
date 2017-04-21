/*:
 Insertion Sort
 */
func insertionSort<T>(in array: [T], order: (T, T) -> Bool) -> [T] {
    var arr = array
    if arr.count > 1 {
        for idx in 1..<arr.count {
            var i = idx
            let temp = arr[i]
            while i > 0 && order(temp, arr[i - 1]) {
                arr[i] = arr[i - 1]
                i -= 1
            }
            arr[i] = temp
        }
    }
    return arr
}
//: TEST
var numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
numbers = insertionSort(in: numbers, order: <)
numbers

var strings = [ "b", "a", "d", "c", "e" ]
strings = insertionSort(in: strings) { $0 < $1 }
strings

struct Obj {
    var priority: Int
}
let obj1 = Obj(priority: 3)
let obj2 = Obj(priority: 8)
let obj3 = Obj(priority: 6)
let obj4 = Obj(priority: 0)
let obj5 = Obj(priority: 9)
let obj6 = Obj(priority: -6)
var objects = [ obj1, obj2, obj3, obj4, obj5, obj6 ]
objects = insertionSort(in: objects) {
    $0.priority > $1.priority
}
objects
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
