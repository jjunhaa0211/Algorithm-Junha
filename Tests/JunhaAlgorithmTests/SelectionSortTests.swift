//
//  SelectionSortTests.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import XCTest
import JunhaAlgorithm

final class SelectionSortTests: XCTestCase {

    func test_선택_정렬_함수_실행() {
        var selection: [Int] = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        let sort = selection.selectionSort()
        XCTAssertEqual(sort, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
}
