/*:
 Tree
 */
public class TreeNode<T> {
    public var value: T
    public weak var parent: TreeNode?
    public var children = [TreeNode]()
    
    public init(_ value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var depth: Int {
        var d = 0
        var p = parent
        while p != nil {
            d += 1
            p = p!.parent
        }
        
        return d
    }
    
    public func addChild(_ node: TreeNode) {
        children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var str = "\(value)"
        if !children.isEmpty {
            str += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return str
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}
//: TEST
let tree = TreeNode<String>("beverages")

let hotNode = TreeNode<String>("hot")
let coldNode = TreeNode<String>("cold")

let teaNode = TreeNode<String>("tea")
let coffeeNode = TreeNode<String>("coffee")
let chocolateNode = TreeNode<String>("cocoa")

let blackTeaNode = TreeNode<String>("black")
let greenTeaNode = TreeNode<String>("green")
let chaiTeaNode = TreeNode<String>("chai")

let sodaNode = TreeNode<String>("soda")
let milkNode = TreeNode<String>("milk")

let gingerAleNode = TreeNode<String>("ginger ale")
let bitterLemonNode = TreeNode<String>("bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)

tree

tree.search("cocoa")
tree.search("chai")
tree.search("bubbly")

tree.depth
hotNode.depth
teaNode.depth
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
