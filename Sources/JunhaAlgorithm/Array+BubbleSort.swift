//
//  File.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import Foundation

public extension Array where Element == Int {
    mutating func bubbleSort() {
        for i in 0..<self.count {
            for j in 0..<self.count-1-i {
                if self[j] > self[j+1] {
                    let temp = self[j]
                    self[j] = self[j+1]
                    self[j+1] = temp
                }
            }
        }
    }
}
