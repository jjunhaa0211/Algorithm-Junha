import UIKit

var arr: [Int] = [10, 1, 3, 8, 7, 6, 4, 5, 2, 9]

/// - Complexity: O(1)
func insertionSort(_ arr: [Int]) -> [Int] {
    
    var a = arr
    
    for var i in 1..<a.count {

        while i > 0 && a[i] < a[i - 1] {
            let temp = a[i]
            a[i] = a[i - 1]
            a[i - 1] = temp
            i -= 1
        }
    }
    
    return a
    
}

print(insertionSort(arr))
