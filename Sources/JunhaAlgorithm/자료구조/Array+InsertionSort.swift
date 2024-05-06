//
//  File.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import Foundation

public extension Array where Element == Int {
    mutating func insertionSort() -> [Int] {
        print("삽입 정렬(Insertion Sort) 시작합니다.\n삽입 정렬은 제자리 비교 정렬 알고리즘의 일종으로, 소팅된 부분에 현재 요소를 반복적으로 삽입함으로써 작업을 수행합니다.")
        print("시간 복잡도는 최악의 경우 O(n^2)이며, 최선의 경우 O(n)입니다.")
        print("도움이 될 만한 팁: 삽입 정렬은 이미 거의 정렬된 배열에 대해서 매우 빠릅니다. 배열의 크기가 작을 때 효율적일 수 있으며, 안정적인 정렬 방식입니다.")

        var temp = 0
        for var i in 1..<self.count {
            while i > 0 && self[i] < self[i-1] {
                temp = self[i]
                self[i] = self[i-1]
                self[i-1] = temp
                i = i - 1
            }
        }
        
        print("정렬 완료된 배열:", self)
        return self
    }
}
