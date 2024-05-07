//
//  File.swift
//  
//
//  Created by 박준하 on 5/7/24.
//

import Foundation

class DoublyLinkedNode<T: Equatable> {
    let id: Int
    let data: T
    var next: DoublyLinkedNode? = nil
    var prev: DoublyLinkedNode? = nil
    
    init(id: Int, data: T) {
        self.id = id
        self.data = data
    }
}

struct DoublyLinkedList<T: Equatable> {
    private var head: DoublyLinkedNode<T>?
    private var tail: DoublyLinkedNode<T>?
    
    public var front: DoublyLinkedNode<T>? {
        return head
    }
    
    public var back: DoublyLinkedNode<T>? {
        return tail
    }
    
    mutating public func add(node: DoublyLinkedNode<T>) {
        if self.head == nil {
            self.head = node
            self.tail = node
            return
        }
        
        self.tail?.next = node
        node.prev = self.tail
        self.tail = node
    }
    
    mutating public func searchNode(with data: T) -> DoublyLinkedNode<T>? {
        var now = self.head
        while now?.data != data && now !== tail {
            now = now?.next
        }
        return now
    }
    
    mutating public func deleteNode(with id: Int) -> DoublyLinkedNode<T>? {
        var now = self.head
        
        if id == self.tail?.id {
            now = self.tail
        } else {
            while now?.id != id && now != nil {
                now = now?.next
            }
        }
        
        let deleted = now
        deleted?.next?.prev = deleted?.prev
        deleted?.prev?.next = deleted?.next
        
        if deleted === head {
            self.head = deleted?.next
        }
        
        if deleted === tail {
            self.tail = deleted?.prev
        }
        
        return deleted
    }
    
    mutating public func insert(node: DoublyLinkedNode<T>, after id: Int) {
        guard head != nil else { return }
        var now = self.head
        if id == self.tail!.id {
            self.add(node: node)
        }
        
        while now?.id != id && now != nil {
            now = now?.next
        }
        if now === self.tail {
            self.tail = node
        }
        node.next = now?.next
        now?.next?.prev = node
        now?.next = node
        node.prev = now
    }
    
    mutating public func insert(node: DoublyLinkedNode<T>, before id: Int) {
        guard head != nil else { return }
        var now = self.head
        
        if id == self.tail?.id {
            now = self.tail
        } else {
            while now?.id != id && now != nil {
                now = now?.next
            }
        }
        
        if now === self.head {
            self.head = node
        }
    
        now?.prev?.next = node
        node.prev = now?.prev
        now?.prev = node
        node.next = now
    }
    
    mutating public func reverse() {
        var now = head
        while now != nil {
            let nowNext = now?.next
            now?.next = now?.prev
            now?.prev = nowNext
            now = now?.prev
        }
        let nowHead = self.head
        self.head = self.tail
        self.tail = nowHead
    }
    
    public func showAll() {
        var now = head
        print("===== Linked List ======")
        while now != nil {
            now?.next == nil
            ? print("id: \(now!.id) | data: \(now!.data)")
            : print("id: \(now!.id) | data: \(now!.data) -> ")
            now = now?.next
        }
        print("========================")
    }
}
