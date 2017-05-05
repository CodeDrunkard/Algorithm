/*:
 Binary Tree
 */
public indirect enum BinaryTree<T> {
    case empty
    case node(BinaryTree<T>, T, BinaryTree<T>)
}

extension BinaryTree {
    public var count: Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return left.count + 1 + right.count
        }
    }
}

// Performance: O(n)
extension BinaryTree {
    public func traverseInOrder(process: (T) -> Swift.Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder(process: (T) -> Swift.Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T) -> Swift.Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case .empty:
            return ""
        case let .node(left, value, right):
            return "\(left.description) \(value) \(right.description)"
        }
    }
}

//: TEST

// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)
// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)
// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)
// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

tree
tree.count

print("traverseInOrder")
tree.traverseInOrder { print($0) }
print("traversePostOrder")
tree.traversePostOrder { print($0) }
print("traversePreOrder")
tree.traversePreOrder { print($0) }

//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
