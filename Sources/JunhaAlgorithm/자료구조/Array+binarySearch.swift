//
//  File.swift
//  
//
//  Created by 박준하 on 5/8/24.
//

import Foundation

public extension Array where Element == Int {
    
    // 반복문으로 구현
    /// 반복문으로 구현
    func binarySearch(num: Int) -> Int? {
        var left = 0
        var right = self.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if self[mid] == num {
                return mid + 1
            } else if self[mid] < num {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return nil
    }
    
    /// 재귀함수로 구현한 이진 탐색
    func binarySearchRecursive(num: Int) -> Bool {
        return binarySearchRecursive(ArraySlice(self), num: num)
    }
    
    // 재귀로 구현 // 값이 있으면 ture
    private func binarySearchRecursive(_ array: ArraySlice<Int>, num: Int) -> Bool {
        if array.count == 0 {
            return false
        }
        
        let midIndex = array.count / 2
        let midElement = array[midIndex]
        
        if midElement == num {
            return true
        } else if midElement < num {
            return binarySearchRecursive(array[array.index(after: midIndex)...], num: num)
        } else {
            return binarySearchRecursive(array[..<midIndex], num: num)
        }
    }
}
