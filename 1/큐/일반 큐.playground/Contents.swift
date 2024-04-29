import UIKit

protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct QueueArray<T>: Queue {
    private var array: [T] = []
    var isEmpty: Bool {
        return array.isEmpty
    }
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    // 리턴 값을 무시하고 에러를 도출하지 말아라
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

var q = QueueArray<Int>()
q.enqueue(10)
q.enqueue(9)
q.enqueue(8)
q.enqueue(7)
q.enqueue(6)

q.peek
q.peek
q.dequeue()
q.peek
