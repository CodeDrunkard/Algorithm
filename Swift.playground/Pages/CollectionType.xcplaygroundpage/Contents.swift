/*:
 
 */
//: Array (有序值)
let emptyArr = [Int]()
let literalArr = [1, 1]

//: Dictionary (无序唯一值)
let emptyDic = [String: AnyObject]()
var literalDic = [1: "1", 2: "2"] // [1: "1", 1: "2"]
literalDic.updateValue("1", forKey: 2)
literalDic.removeValue(forKey: 2)
literalDic[2] = "3"
literalDic.keys.sorted()

//: Set (无序键值对)
let emptySet = Set<Int>()
let literalSet: Set = [1, 1]
/*:
 * 使用 intersection(_:)方法来创建一个只包含两个合集共有值的新合集；
 * 使用 symmetricDifference(_:)方法来创建一个只包含两个合集各自有的非共有值的新合集；
 * 使用 union(_:)方法来创建一个包含两个合集所有值的新合集；
 * 使用 subtracting(_:)方法来创建一个两个合集当中不包含某个合集值的新合集。
 */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
/*:
 * 使用“相等”运算符 ( == )来判断两个合集是否包含有相同的值；
 * 使用 isSubset(of:) 方法来确定一个合集的所有值是被某合集包含；
 * 使用 isSuperset(of:)方法来确定一个合集是否包含某个合集的所有值；
 * 使用 isStrictSubset(of:) 或者 isStrictSuperset(of:)方法来确定是个合集是否为某一个合集的子集或者超集，但并不相等；
 * 使用 isDisjoint(with:)方法来判断两个合集是否拥有完全不同的值。
 */
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)


