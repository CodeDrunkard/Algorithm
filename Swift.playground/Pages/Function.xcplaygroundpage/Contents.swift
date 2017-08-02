/*:
 Function
 */

// 使用函数类型
func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

var mathFunction: (Int, Int) -> Int = add
mathFunction(1, 2)
let method = mathFunction
method(1, 2)

// 函数类型作为返回类型
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

let currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
moveNearerToZero
moveNearerToZero(currentValue)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
