//
//  File.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import Foundation

public extension Array where Element == Int {
    mutating func bubbleSort() -> [Int] {
        print("버블 정렬 시작: 이 알고리즘은 인접한 두 원소를 비교하여 정렬하는 가장 기본적인 정렬 방법입니다.")
        print("시간 복잡도: 최악의 경우 O(n^2), 최선의 경우 O(n)입니다.")
        print("도움이 될 내용: 버블 정렬은 이해하기 쉽고 구현하기 간단하지만, 큰 데이터 집합에는 비효율적일 수 있습니다.")
        
        for i in 0..<self.count {
            for j in 0..<self.count-1-i {
                if self[j] > self[j+1] {
                    let temp = self[j]
                    self[j] = self[j+1]
                    self[j+1] = temp
                }
            }
        }
        
        print("정렬 완료된 배열: \(self)")
        return self
    }
}
