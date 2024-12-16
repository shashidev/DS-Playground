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


class SinglyLinkedList {


    private var head: Node?


    func insert(value: Int) {

        let newNode = Node(value: value)

        if head == nil {
            head = newNode
        }else {

            var current = head

            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }

    func insertAtBegning(value: Int) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
    }

    func insertAtEnd(value: Int) {

    }


    func remove(value: Int) {

        if head!.value == value {
            head = head?.next
            return
        }

        var current = head
        var prev: Node?

        while current != nil && current!.value != value {
            prev = current
            current = current?.next
        }

        guard current != nil else { return }

        prev?.next = current?.next
    }

    func bubbleSort() {

        guard head != nil else { return }

        var swapped: Bool


        repeat {

            swapped = false
            var current = head

            while current?.next != nil {

                if current!.value > current!.next!.value {
                    //swapping
                    swapped = true
                    let temp = current!.next!.value
                    current!.next!.value = current!.value
                    current!.value = temp
                }

                current = current?.next
            }

        }while swapped
    }

    func  printList() {
        guard head != nil else { return }


        var current = head

        while current != nil {
            print(current!.value, terminator: " -> ")
            current = current?.next
        }
        print("nil")
    }
}


let list = SinglyLinkedList()

list.insert(value: 5)
list.insert(value: 1)
list.insert(value: 6)
list.insert(value: 3)
list.insert(value: 10)
list.bubbleSort()
list.printList()
