//
//  main.swift
//  큐(백준)_10845
//
//  Created by 박준하 on 5/2/24.
//

import Foundation

protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    public var array: [T] = []
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

let N = Int(readLine()!)!

var queue = QueueArray<Int>()

for _ in 0..<N {
    let command = readLine()!.split(separator: " ")
    switch command[0] {
    case "push":
        if let x = Int(command[1]) {
            queue.enqueue(x)
        }
    case "pop":
        print(queue.dequeue() ?? -1)
    case "size":
        print(queue.array.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        print(queue.peek ?? -1)
    case "back":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.array.last!)
        }
    default:
        break
    }
}
