/*:
 Linear Search
 
 Performance: O(n)
 */
public func linearSearch<T: Equatable>(_ array: [T], search object: T) -> Int?{
    for (index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}

//: TEST
let array = [2, 3, 4, 5, 6]
linearSearch(array, search: 3)
linearSearch(array, search: 0)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
