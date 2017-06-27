/*:
 Binary Search Tree
 */
public enum BinarySearchTree<T: Comparable> {
    case empty
    case leaf(T)
    indirect case node(BinarySearchTree, T, BinarySearchTree)
}

extension BinarySearchTree {
    public var count: Int {
        switch self {
        case .empty:
            return 0
        case .leaf:
            return 1
        case let  .node(left, _, right):
            return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .empty:
            return 0
        case .leaf:
            return 1
        case let .node(left, _, right):
            return 1 + max(left.count, right.count)
        }
    }
}

extension BinarySearchTree {
    public func insert(_ value: T) -> BinarySearchTree {
        switch self {
        case .empty:
            return .leaf(value)
        case let .leaf(v):
            if v > value {
                return .node(.leaf(value), v, .empty)
            } else {
                return .node(.empty, v, .leaf(value))
            }
        case let .node(left, v, right):
            if v > value {
                return .node(left.insert(value), v, right)
            } else {
                return .node(left, v, right.insert(value))
            }
        }
    }
    
    public func search(_ value: T) -> BinarySearchTree? {
        switch self {
        case .empty:
            return nil
        case let .leaf(v):
            return v == value ? self : nil
        case let .node(left, v, right):
            if v == value {
                return self
            } else if v > value {
                return left.search(value)
            } else {
                return right.search(value)
            }
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case .empty:
            return "_"
        case let .leaf(v):
            return "\(v)"
        case let .node(left, v, right):
            return "(\(left.description) <- \(v) -> \(right.description))"
        }
    }
}
//: TEST
/*
         7
      /     \
     2      10
    / \     /
   1   5   9
      / \
     3   5
 */
var tree = BinarySearchTree.leaf(7)
tree.count
tree.height
tree = tree.insert(2)
tree = tree.insert(5)
tree = tree.insert(3)
tree = tree.insert(10)
tree = tree.insert(9)
tree.insert(1)
tree.insert(5)

print(tree)

tree.search(8)
tree.search(1)
tree.search(5)
tree.search(2)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
