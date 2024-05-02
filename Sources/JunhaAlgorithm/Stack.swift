import Foundation

public struct Stack<T> {
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
        return isEmpty ? nil : stack.popLast()
    }
    
    public func item(at index: Int) -> T? {
        guard index >= 0 && index < stack.count else {
            return nil
        }
        return stack[index]
    }
    
    public init() { }
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
            """
    ----top----
    \(stack.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
    }
}
