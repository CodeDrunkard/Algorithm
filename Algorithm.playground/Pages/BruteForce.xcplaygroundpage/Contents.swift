/*:
 Brute Force
 */
extension String {
    func index(of pattern: String) -> String.Index? {
        for idx in self.characters.indices {
            var j = idx
            var found = true
            for i in pattern.characters.indices {
                if j == self.characters.endIndex || self[j] != pattern[i] {
                    found = false
                    break
                } else {
                    j = self.characters.index(after: j)
                }
            }
            if found {
                return idx
            }
        }
        return nil
    }
}
//: TEST
let s = "Hello, WorlWd"
s.index(of: "World")
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
