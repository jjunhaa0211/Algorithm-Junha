//
//  File.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import Foundation

public extension Array where Element == Int {
    mutating func selectionSort() {
        print("선택 정렬(Selection Sort) 시작합니다.\n선택 정렬은 제자리 비교 정렬 알고리즘입니다. 각 단계에서 리스트에서의 최솟값을 찾아 선택한 다음, 현재의 위치와 그것을 교환하는 방법을 통해 정렬을 수행합니다.")
        print("시간 복잡도는 최악, 최선, 평균 모두에서 O(n^2) 입니다.")
        print("도움이 될 만한 팁: 선택 정렬은 작은 배열에서 효율적으로 작동할 수 있습니다. 하지만, 데이터가 많을수록 정렬 속도는 상대적으로 느려집니다.")

        var minIndex = 0
        var temp = 0
        
        for i in 0..<self.count {
            minIndex = i
            
            for j in i+1..<self.count {
                if self[j] < self[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                temp = self[i]
                self[i] = self[minIndex]
                self[minIndex] = temp
            }
        }
        print("정렬 완료된 배열:", self)
    }
}
