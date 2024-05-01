//
//  QueueTests.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import XCTest
import JunhaAlgorithm

final class QueueTests: XCTestCase {

    func test_큐가_초기에_비어있는지_확인() {
        var queue = QueueArray<Int>()
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_요소_추가_후_비어있지_않음_확인() {
        var queue = QueueArray<Int>()
        queue.enqueue(1)
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_Peek_기능동작_확인() {
        var queue = QueueArray<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        XCTAssertEqual(queue.peek, 1)
    }
    
    func test_요소_제거_후_큐_상태확인() {
        var queue = QueueArray<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        _ = queue.dequeue()
        XCTAssertEqual(queue.peek, 2)
    }
    
    func test_모든_요소_제거_후_비어있는지_확인() {
        var queue = QueueArray<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        _ = queue.dequeue()
        _ = queue.dequeue()
        XCTAssertTrue(queue.isEmpty)
    }
}
