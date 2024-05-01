import UIKit

public class Node<T> {
    public var data: T?
    public var next: Node?
    
    public init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

public struct LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    public init(head: Node<T>? = nil) {
        self.head = head
    }
    
    mutating public func append(_ data: T?) {
        // 리스트에 값이 없을때 새롭게 헤드 지정
        if head == nil {
            head = Node(data: data)
            return
        }
        // 리스트에 값이 이미 존재할때 다음 노드가 없는곳까지 찾은 다음 마지막에 배치
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    // 특정 위치에 새로운 노드 삽입
    mutating public func insert(_ data: T, at index: Int) {
        // 리스트 값 없을때 새롭게 헤드 지정
        if head == nil {
            head = Node(data: data)
            return
        }
        // 중간에 데이터 삽입 시
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next == nil { break }
            node = node?.next
        }
        let nextNode = node?.next
        let insertNode = Node(data: data)
        node?.next = insertNode
        insertNode.next = nextNode
    }
    
    // 마지막 데이터 요소 삭제
    mutating public func removeLast() {
        // 데이터 없을 시 미삭제
        if head == nil {
            return
        }
        // 데이터 1개일 시 헤드 삭제
        if head?.next == nil {
            head = nil
            return
        }
        // 데이터 여러개일 시 마지막 요소 찾아서 삭제
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        node?.next = nil
    }
    
    // 원하는 위치 요소 삭제
    mutating public func remove(at index: Int) {
        // 데이터 없다면 탈출
        if head == nil { return }
        // head를 삭제할때
        if index == 0 || head?.next == nil {
            head = head?.next
            return
        }
        // 삭제할 노드의 다음 노드를 이전 노드가 연결하게 변경
        var node = head
        for _ in 0..<(index - 1) {
            // 삭제할 노드가 맨 마지막 노드일때 삭제
            if node?.next?.next == nil {
                break
            }
            node = node?.next
        }
        node?.next = node?.next?.next
    }
    
    // 전체 연결 리스트 삭제
    mutating public func removeAll() {
        head = nil
    }
    
    // 데이터로 원하는 노드 찾기
    mutating public func searchNode(from data: T?) -> Node<T>? {
        // 데이터가 없으면 nil 반환
        if head == nil { return nil }
        var node = head
        while node?.next != nil {
            if node?.data == data {
                break
            }
            node = node?.next
        }
        return node
    }
    
    // 연결 리스트의 사이즈 측정
    public func size() -> Int {
        var node = head
        if node == nil {
            return 0
        }
        var count = 1
        
        while node?.next != nil {
            node = node?.next
            count += 1
        }
        return count
    }
    
    // 찾는 데이터가 있는지에 대해 판별
    public func contains(_ data: T) -> Bool {
        var node = head
        
        while true {
            if node?.data == data {
                return true
            }
            node = node?.next
            if node?.data == nil {
                return false
            }
        }
    }
    
    // 연결 리스트가 비어있는지 판별
    public var isEmpty: Bool {
        return head == nil
    }
}
