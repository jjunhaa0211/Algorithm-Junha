import Foundation

var arr: [Int] = [10, 1, 3, 8, 7, 6, 4, 5, 2, 9]

var temp = 0
var min = 0

for i in 0..<arr.count {
    min = i
    
    for j in i+1..<arr.count {
        if arr[j] < arr[min] {
            min = j
        }
    }
    
    if i != min {
        temp = arr[i]
        arr[i] = arr[min]
        arr[min] = temp
    }
}

for i in 0..<10 {
    print(arr[i])
}
