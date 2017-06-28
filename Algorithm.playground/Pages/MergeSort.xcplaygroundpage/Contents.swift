/*:
 Merge Sort
 */
func mergeSort<T>(in array: [T], order: (T, T) -> Bool) -> [T] where T: Comparable {
    guard array.count > 1 else {
        return array
    }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(in: Array(array[0..<middleIndex]), order: order)
    let rightArray = mergeSort(in: Array(array[middleIndex..<array.count]), order: order)
    return mergeArray(with: leftArray, with: rightArray, order: order)
}

private func mergeArray<T>(with leftArray: [T], with rightArray: [T], order: (T, T) -> Bool) -> [T] where T: Comparable {
    var leftIndex = 0;
    var rightIndex = 0;
    var orderedArray = [T]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftValue = leftArray[leftIndex]
        let rightValue = rightArray[rightIndex]
        if leftValue == rightValue {
            orderedArray.append(leftValue)
            leftIndex += 1
            rightIndex += 1
            print("equal")
        } else if order(leftValue, rightValue) {
            orderedArray.append(leftArray[leftIndex])
            print("left : \(leftArray[leftIndex])")
            leftIndex += 1
        } else {
            orderedArray.append(rightArray[rightIndex])
            print("right : \(rightArray[rightIndex])")
            rightIndex += 1
        }
    }
    
    while leftIndex < leftArray.count {
        orderedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightArray.count {
        orderedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}
//: TEST
var numbers = [2, 1, 5, 4, 9]
mergeSort(in: numbers, order: <)
mergeSort(in: numbers, order: >)
//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
