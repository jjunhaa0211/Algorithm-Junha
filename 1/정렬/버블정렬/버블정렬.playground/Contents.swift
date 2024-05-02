import UIKit

var arr: [Int] = [10, 1, 3, 8, 7, 6, 4, 5, 2, 9]

var temp = 0;
for i in 0..<arr.count {
    for j in 0..<arr.count-1-i {
        if arr[j] > arr[j + 1] {
            temp = arr[j]
            arr[j] = arr[j + 1]
            arr[j + 1] = temp;
        }
    }
}

for k in 0..<arr.count {
    print(arr[k])
}
