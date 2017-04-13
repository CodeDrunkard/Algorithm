/*:
 Deque
 
 Note: Remove and add an element at the lead of the array is an O(n) operation. 
       Of course, we can set an empty array to lead of the array to make prepend effective, and use the same trick at pop first operation.
 
 Enqueeing and dequeuing are O(1) operation.
 */
public struct Deque<T> {
    
    fileprivate private(set) var array: [T?]
    fileprivate private(set) var head: Int
    fileprivate private(set) var capacity: Int
    fileprivate private(set) var originalCapacity: Int
    
    public init(capacity: Int) {
        self.capacity = max(capacity, 0)
        head = capacity
        originalCapacity = capacity
        array = [T?](repeating: nil, count: capacity)
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var front: T? {
        return isEmpty ? nil : array[head]
    }
    
    public var back: T? {
        return isEmpty ? nil : array.last!
    }
    
    public mutating func append(_ element: T) {
        array.append(element)
    }
    
    public mutating func prepend(_ element: T) {
        if head == 0 {
            capacity *= 2
            let emptySpace = [T?](repeating: nil, count: capacity)
            array.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        head -= 1
        array[head] = element
    }
    
    public mutating func popLast() -> T? {
        return isEmpty ? nil : array.removeLast()
    }
    
    public mutating func popFirst() -> T? {
        guard let element = front else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        if capacity > originalCapacity && head >= capacity * 2 {
            let amountToRemove = capacity + capacity/2
            array.removeFirst(amountToRemove)
            head -= amountToRemove
            capacity /= 2
        }
        
        return element
    }
}

//: TEST
var deque = Deque<Int>(capacity: 2)
deque.isEmpty
deque.capacity
deque.append(4)
deque.prepend(3)
deque.prepend(2)
deque.count
deque.prepend(1)
deque.capacity
deque.prepend(0)
deque.prepend(0)
deque.prepend(0)
deque.prepend(0)
deque.capacity

deque.front
deque.back
while deque.popFirst() != nil { }
deque.popLast()
deque.front
deque.back

deque.capacity
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
