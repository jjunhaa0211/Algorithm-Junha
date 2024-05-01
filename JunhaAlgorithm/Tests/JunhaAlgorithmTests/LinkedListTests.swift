//
//  LinkedListTests.swift
//
//
//  Created by 박준하 on 5/2/24.
//

import XCTest
import JunhaAlgorithm

final class LinkedListTests: XCTestCase {
    
    func test_연결리스트가_비어있는지_확인() {
        let linkedList = LinkedList<Int>()
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func test_데이터_추가_후_사이즈_증가_확인() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        XCTAssertEqual(linkedList.size(), 2)
    }
    
    func test_특정_인덱스에_데이터_삽입_후_사이즈_증가_확인() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.insert(2, at: 1)
        XCTAssertEqual(linkedList.size(), 2)
    }
    
    func test_마지막_데이터_삭제_확인() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.removeLast()
        XCTAssertEqual(linkedList.size(), 1)
    }
    
    func test_특정_인덱스_데이터_삭제_확인() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.remove(at: 1)
        XCTAssertEqual(linkedList.size(), 2)
        XCTAssertFalse(linkedList.contains(2))
    }
    
    func test_모든_데이터_삭제_후_비어있는지_확인() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.removeAll()
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func test_데이터로_노드_검색_확인() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        let node = linkedList.searchNode(from: 2)
        XCTAssertNotNil(node)
        XCTAssertEqual(node?.data, 2)
    }
    
    func test_데이터_포함_여부_확인() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        XCTAssertTrue(linkedList.contains(2))
    }
}
