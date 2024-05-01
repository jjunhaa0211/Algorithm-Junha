//
//  StackTests.swift
//  
//
//  Created by 박준하 on 5/2/24.
//

import XCTest
import JunhaAlgorithm

final class StackTests: XCTestCase {

    func test_스택이_초기에_비어있는지_확인() {
        let stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func test_push로_요소가_추가_되는지_확인() {
        var stack = Stack<Int>()
        stack.push(1)
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.count, 1)
    }
    
    func test_pop으로_요소가_제거_되는지_확인() {
        var stack = Stack<Int>()
        stack.push(1)
        let popResult = stack.pop()
        XCTAssertEqual(popResult, 1)
        XCTAssertTrue(stack.isEmpty)
    }
    
    func test_peek으로_마지막_요소를_확인() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        let peekResult = stack.peek()
        XCTAssertEqual(peekResult, 2)
        XCTAssertEqual(stack.count, 2) // peek 함수 이후에 함수가 달라지는 테스트 (변동이 없어야함)
    }
    
    func test_count로_스택_크기를_확인() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        XCTAssertEqual(stack.count, 2)
    }

}
