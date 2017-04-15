/*:
 Linked List
 
 Note: 
 
 Operations are O(1).
 */
public class ListNode<T> {
    public var value: T
    public var next: ListNode?
    public weak var previous: ListNode?
    
    public init(_ value: T) {
        self.value = value
    }
}

final public class List<T> {
    public typealias Node = ListNode<T>
    
    public fileprivate(set) var lead: Node?
    public fileprivate(set) var tail: Node?
    public fileprivate(set) var count: Int = 0
    
    public init() {}
}

extension List {
    public var isEmpty: Bool {
        return lead == nil
    }
    
    @discardableResult
    public func append(value: T) -> Node {
        let new = Node(value)
        if isEmpty {
            lead = new
            tail = new
        } else {
            new.previous = tail
            tail!.next = new
            tail = new
        }
        count += 1
        return tail!
    }
    
    public func node(at index: Int) -> Node {
        assert(index >= 0 && index < count, "illegal index!")
        
        let pivot = (count - 1) / 2
        if index > pivot {
            var i = count - 1
            var previous = tail
            while true {
                if i == index {
                    return previous!
                }
                i -= 1
                previous = previous!.previous
            }
        } else {
            var i = 0
            var next = lead
            while true {
                if i == index {
                    return next!
                }
                i += 1
                next = next!.next
            }
        }
    }
    
    @discardableResult
    public func insert(value: T, at index: Int) -> Node {
        if isEmpty {
            return append(value: value)
        } else if index == count {
            let new = Node(value)
            
            return new
        } else {
            let insertedNode = node(at: index)
            let new = Node(value)
            
            if let pre = insertedNode.previous {
                pre.next = new
                new.previous = pre
            } else {
                lead = new
            }
            
            new.next = insertedNode
            insertedNode.previous = new
            
            count += 1
            
            return new
        }
    }
    
    private func remove(_ node: Node) {
        if let pre = node.previous {
            pre.next = node.next
        } else {
            lead = node.next
        }
        
        if let nex = node.next {
            nex.previous = node.previous
        } else {
            tail = node.previous
        }
        
        count -= 1
        node.previous = nil
        node.next = nil
    }
    
    @discardableResult
    public func remove(at index: Int) -> Node {
        let node = self.node(at: index)
        remove(node)
        return node
    }
    
    public func removeLead() {
        guard let lead = lead else {
            return
        }
        remove(lead)
    }
    
    public func removeTail() {
        guard let tail = tail else {
            return
        }
        remove(tail)
    }
    
    public func removeAll() {
        lead = nil
        tail = nil
    }
}

extension List {
    public func reverse() {
        var node = lead
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            lead = currentNode
        }
    }
}

extension List {
    public func map<U>(transform: (T) -> U) -> List<U> {
        let result = List<U>()
        var node = lead
        while node != nil {
            result.append(value: transform(node!.value))
            node = node!.next
        }
        return result
    }
    
    public func filter(predicate: (T) -> Bool) -> List<T> {
        let result = List<T>()
        var node = lead
        while node != nil {
            if predicate(node!.value) {
                result.append(value: node!.value)
            }
            node = node!.next
        }
        return result
    }
}

extension List {
    public subscript(_ index: Int) -> T {
        let n = node(at: index)
        return n.value
    }
}

extension List: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = lead
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}

extension List {
    convenience init(array: Array<T>) {
        self.init()
        
        for element in array {
            self.append(value: element)
        }
    }
}

extension List: ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: T...) {
        self.init()
        
        for element in elements {
            self.append(value: element)
        }
    }
}
//: TEST
var list = List<Int>()

list.isEmpty

//list.node(at: 0).value
//list.remove(at: 0)
list.insert(value: -1, at: 0).value
list.remove(at: 0).value
list.insert(value: -2, at: 0).value

list.append(value: 0).next?.value
list.append(value: 1).previous?.value
list.append(value: 2).previous?.value

list.count
list.lead?.value
list.tail?.value

list.node(at: 1).value
//list.node(at: 3).value
list.insert(value: 3, at: 3)

var array: List = ["A", "B", "C", "D"]
array.reverse()
let map = array.map { $0.characters.count }
map
let filter = array.filter { $0 > "B" }
filter

//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
