/*:
 Quick Sort
 */
func quickSort<T>(in array: [T]) -> [T] where T: Comparable {
    var arr = array
    guard arr.count > 1 else {
        return arr
    }
    let pivot = arr[arr.count / 2]
    let less = arr.filter { $0 < pivot }
    let equal = arr.filter { $0 == pivot }
    let greater = arr.filter { $0 > pivot }
    
    return quickSort(in: less) + equal + quickSort(in: greater)

}
//: TEST
let numbers = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
quickSort(in: numbers)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
