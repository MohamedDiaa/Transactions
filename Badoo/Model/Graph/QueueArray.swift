//
//  QueueArray.swift
//  Badoo
//
//  Created by Mohamed Alwakil on 2022-03-11.
//

import Foundation

public protocol Queue{
    
    associatedtype Element
    
    var isEmpty: Bool { get}
    func enqueue(_ element: Element)
    func dequeue() -> Element?
}

public class QueueArray<T>: Queue {
    
    public typealias Element = T
    var array: [T] = []
    
    public var isEmpty: Bool {
        return array.isEmpty
    }

    public func enqueue(_ element: Element) {
        
        array.append(element)
    }

    public func dequeue() -> Element? {
        
        return array.removeFirst()
    }
}
