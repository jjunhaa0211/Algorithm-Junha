//
//  BubbleSortTests.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import XCTest
import JunhaAlgorithm

final class BubbleSortTests: XCTestCase {

    func test_버블_정렬_함수_실행() {
        var bubble: [Int] = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        bubble.bubbleSort()
        XCTAssertEqual(bubble, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
}
