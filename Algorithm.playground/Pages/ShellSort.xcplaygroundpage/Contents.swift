/*:
 Shell Sort
 */
func shellSort<T>(in array: [T], order: (T, T) -> Bool) -> [T] where T: Comparable {
    var arr = array
    if arr.count > 1 {
        var inc = arr.count / 2
        while inc > 0 {
            for (var i, el) in arr.enumerated() {
                while i >= inc && order(arr[i - inc], el) {
                    arr[i] = arr[i - inc]
                    i -= inc
                }
                arr[i] = el
            }
            inc /= 2
        }
    }
    return arr
}
//: TEST
var numbers = [22, 7, 2, -5, 8, 4]
numbers = shellSort(in: numbers, order: <)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
