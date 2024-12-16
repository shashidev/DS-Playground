//: [Previous](@previous)

import Foundation


class Node {
    var prev: Node?
    var value: Int
    var next: Node?
    init(prev: Node? = nil, value: Int, next: Node? = nil) {
        self.prev = prev
        self.value = value
        self.next = next
    }
}

class DoublyLinkedList {
    private var head: Node?
    private var tail: Node?

    func inset(value: Int) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        }else {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }
    }

    func insertAtBegning(value: Int) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        }else {
            newNode.next = head
            head?.prev = newNode
            head = newNode
        }
    }

    func insertAtEnd(value: Int) {
        let newNode = Node(value:value)
        if tail == nil {
            head = newNode
            tail = newNode
        }else {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }
    }

    func search(value: Int)-> Bool {
        guard head != nil else { return false}
        var current = head
        while current?.next != nil {
            if current!.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }

//head- 1  2  3  4  5-tail
    func remove(value: Int) {

        if head!.value == value {
            head = head?.next
            tail = tail?.next
            return
        }

        var current = head
        var temNode: Node?

        while current != nil && current!.value != value {
            temNode = current
            current = current?.next
        }

        temNode?.next = current?.next?.prev
    }


    func bubbleSort() {

        if head == nil {
            return
        }

        var swapped: Bool

        repeat {
            swapped = false
            var current = head

            while current?.next != nil {

                if current!.value > current!.next!.value {
                    //swap
                    swapped = true
                    let tempNode = current!.next!.value
                    current!.next!.value  = current!.value
                    current!.value = tempNode
                }

                current = current?.next
            }


        }while swapped
    }


    func printList() {
        guard head != nil else {return }
        var current = head
        while current != nil {
            print(current!.value, terminator:" -> ")
            current = current?.next
        }
        print("nil")
    }
}


let list = DoublyLinkedList()
list.inset(value: 100)
list.inset(value: 200)
list.inset(value: 300)
list.inset(value: 400)
list.inset(value: 10)
//list.remove(value: 100)
list.bubbleSort()
list.printList()
