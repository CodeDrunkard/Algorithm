/*:
 Queue
 
 Note1: Setting array[head] to nil to remove lead object from the queue, because delete the first object must edit other objects, it doesn't make sense.
 Note2: If never remove Note1's empty spots that will keep growing as enqueue and dequeue. So it must be removed in some time that you can custom.
 
 Enqueuing and dequeuing are O(1) operations.
 */
public struct Queue<T> {
    fileprivate var array = [T?]() // Must container optional value
    private var head = 0;
    
    public var count: Int {
        return array.count - head;
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var front: T? {
        return isEmpty ? nil : array[head]
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = front else {
            return nil
        }
        
        // Note1.
        array[head] = nil
        head += 1
        // Note2.
        if (array.count > 50) &&
            (Double(head) / Double(array.count) > 0.25) {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public mutating func clear() {
        array.removeAll()
        head = 0
    }
}

extension Queue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init()
        for element in elements {
            self.enqueue(element)
        }
    }
}
//: TEST
var queue: Queue = [0, 1, 2]
queue.count
queue.isEmpty
queue.enqueue(3)
queue.dequeue()
queue.dequeue()
queue.clear()
queue.isEmpty

//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
