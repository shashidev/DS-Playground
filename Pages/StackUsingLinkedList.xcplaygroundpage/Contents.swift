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

class StackUsingLinkedList {

    private var head: Node?

    func push(value: Int) {

        let newNode = Node(value: value)

        if self.isEmpty() {
            head = newNode
            return
        }

        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = newNode
    }

    func pop()-> Int {

        guard !isEmpty() else { return -1 }

        var current = head
        var prev: Node?

        while current?.next != nil {
            prev = current
            current = current?.next
        }

        //If satck has only one element
        if prev == nil {
            let value = head!.value
            head = nil
            return value
        }

        let value = current!.value
        prev?.next = nil
        return value
    }

    func printStack() {
        guard !isEmpty() else { return }
        var current = head
        while current != nil {
            print(current!.value, terminator: " -> ")
            current = current?.next
        }
        print("nil")
    }

    func isEmpty()-> Bool {
        guard head == nil else { return false }
        return true

    }
}

let stack = StackUsingLinkedList()
stack.push(value: 10)
stack.push(value: 20)
stack.push(value: 30)
stack.push(value: 40)
stack.push(value: 50)
stack.printStack()
print(stack.pop())
stack.printStack()
