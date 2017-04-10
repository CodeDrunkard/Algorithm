/*:
 Linear Search
 
 Performance: O(n)
 */
public func linearSearch<T: Equatable>(in array: [T], forKey key: T) -> Int?{
    for (index, obj) in array.enumerated() where obj == key {
        return index
    }
    return nil
}

//: TEST
let array = [2, 3, 4, 5, 6]
linearSearch(in: array, forKey: 3)
linearSearch(in: array, forKey: 0)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
