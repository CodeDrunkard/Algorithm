/*:
 Selected Sort
 */
func selectedSort<T>(in array: [T], order: (T, T) -> Bool) -> [T] where T: Comparable  {
    var arr = array
    if arr.count > 1 {
        for index in 0..<arr.count - 1 {
            var lowestIndex = index
            for other in (index + 1)..<arr.count {
                if order(arr[other], arr[lowestIndex]) {
                    lowestIndex = other
                }
            }
            if lowestIndex != index {
                swap(&arr[lowestIndex], &arr[index])
            }
        }
    }
    return arr
}
//: TEST
var numbers = [1, 5, 10, -9, 2]
numbers = selectedSort(in: numbers, order: <)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
