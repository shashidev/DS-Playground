//: [Previous](@previous)

import Foundation



class Node {

    var value: Int
    var next: Node?

    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class Queue {

    private var head: Node?
    
    func enQueue(value: Int) {
        let newNode = Node(value: value)
        if isEmpty() {
            head = newNode
        }else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }

    func deQueue() -> Int {
        guard !isEmpty() else { return -1 }
        let value = head!.value
        var current = head?.next
        head = current
        return value
    }

    func peek() -> Int {
        guard !isEmpty() else {  return -1 }
        return head!.value
    }

    func isEmpty()-> Bool {
        return head == nil
    }

    func printQueue() {
        guard !isEmpty() else { return }
        var current = head
        while current != nil {
            print(current!.value, terminator: " -> ")
            current = current?.next
        }
        print("Nil")
    }
}



let queue = Queue()

queue.enQueue(value: 10)
queue.enQueue(value: 20)
queue.enQueue(value: 30)
queue.enQueue(value: 40)
queue.printQueue()
print("Peek Value: \(queue.peek())")
print("Dequeue : \(queue.deQueue())")
queue.printQueue()

