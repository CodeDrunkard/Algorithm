/*:
 Enum Stack
 
 A implement stack in enum.
 
 Push and pop are O(1) operations.
 */
public enum EStack<T> {
    case none
    indirect case node(T, next: EStack<T>)
}

extension EStack {
    public func cons(_ element: T) -> EStack {
        return .node(element, next: self)
    }
    
    public mutating func push(_ element: T) {
        self = self.cons(element)
    }
    
    public mutating func pop() -> T? {
        switch self {
        case .none:
            return nil
        case let .node(element, next: list):
            self = list
            return element
        }
    }
}

extension EStack: Sequence, IteratorProtocol {
    public mutating func next() -> T? {
        return pop()
    }
}

extension EStack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self = elements.reversed().reduce(.none) {
            $0.cons($1)
        }
    }
}

//: TEST
var stack1 = EStack<Any>.none
var stack2 = EStack.none.cons(1).cons(2).cons(3)
stack2.pop()
stack2.push(4)

var stack3 = stack2
stack3.pop()
stack3.pop()
stack2.pop()
stack3.pop()
stack3.pop()
stack3.push(5)
stack3.pop()

stack2.pop()
stack2.pop()
stack2.pop()

var arr: EStack = [1, 2, 3, 4]
for x in arr { x }
arr.pop()
arr.pop()
for x in arr { x }

//: EXTENSION - Sequence
struct Countdown: Sequence, IteratorProtocol {
    var count: Int
    
    mutating func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
}

let threeToGo = Countdown(count: 3)
for i in threeToGo { i }
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
