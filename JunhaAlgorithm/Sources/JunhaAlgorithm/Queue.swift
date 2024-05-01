import Foundation

protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var peek: T? {
        return array.first
    }
    
    mutating public func enqueue(_ element: T) {
        return array.append(element)
    }
    
    @discardableResult
    mutating public func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    public init() { }
}
