/*:
 Binary Search
 
 Note: The array must be sorted.
 
 Performance: O(log n)
 */
public func binarySearch<T: Comparable>(_ array: [T], search key: T) -> Int? {
    var lowerBound = 0
    var upperBound = array.count
    while lowerBound < upperBound {
        let midIndex = (upperBound + lowerBound) / 2
        if array[midIndex] == key {
            return midIndex
        } else if array[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}

//: TEST
let array1 = [2, 3, 4, 5, 6, 6]
let array2 = [1, 3, 6, 6, 7]
let array3 = [Int]()

binarySearch(array1.sorted(), search: 3)
binarySearch(array2.sorted(), search: 6)
binarySearch(array3.sorted(), search: 7)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
