/*:
 Count Occurrences
 */
public func countOccurrences<T: Equatable>(ofKey key: T, inArray array: [T]) -> Int {
    let equals = array.filter { $0 == key }
    return equals.count
}

public func mostOccurrences<T: Comparable>(in array: [T]) -> [T: Int] {
    return mostOccurrences(in: array, range: 1)
}

public func mostOccurrences<T: Comparable>(in array: [T], range: Int) -> [T: Int] {
    return aSort(in: array, range: range)
}

public func aSort<T: Comparable>(in array: [T], range: Int) -> [T: Int] {
//    var bucket = [(T, Int)]()
//    var tempArray = [T]()
//    for element in array {
//        if tempArray.contains(element) {
//            
//        } else {
//            tempArray.append(element)
//            bucket.append((element, countOccurrences(ofKey: element, inArray: array))
//        }
//    }
    return [T: Int]()
}

//: TEST
let array = [1, 2, 2, 2, 4, 5, 3, 3]

countOccurrences(ofKey: 2, inArray: array)
countOccurrences(ofKey: 6, inArray: array)

mostOccurrences(in: array)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
