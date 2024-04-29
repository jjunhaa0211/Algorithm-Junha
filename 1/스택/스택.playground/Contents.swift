import UIKit

struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public func peek() -> T? {
        return self.stack.last
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast() // 값이 존재 하지 않다면 nil
    }
}

var s = Stack<Int>()
s.push(10)
s.push(9)
s.push(8)
s.push(7)
s.push(6)
s.count
s.pop()
s.pop()
s.pop()
s.pop()
s.pop()
s.isEmpty
