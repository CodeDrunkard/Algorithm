/*:
 Stack (FILO)
 
 Push and pop are O(1) operations.
 */
public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var top: T? {
        return array.last
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
}

//: TEST
var stack = Stack(array: [1, 2])
stack.isEmpty
stack.count
stack.top
stack.pop()
stack.push(3)
stack.top
stack.pop()
stack.pop()
stack.pop()
stack.count
stack.isEmpty
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
