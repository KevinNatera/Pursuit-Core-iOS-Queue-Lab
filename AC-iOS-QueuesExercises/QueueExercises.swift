import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    if q.isEmpty{ return nil }
    
    var queue = q
    var smallest = queue.peek()
    
    while !queue.isEmpty{
        if let currentElement = queue.dequeue(), let small = smallest{
            if currentElement < small{
                smallest = currentElement
            }
        }
    }
    
    return smallest
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var queue = q
    var result = 0
    
    while !queue.isEmpty{
        if let currentElement = queue.dequeue(){
            result += currentElement
        }
    }
    return result
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    guard !q.isEmpty else { return true }
    
    var queue = q
    var previousElement = queue.dequeue()!
    
    while !queue.isEmpty {
        if let currentElement = queue.dequeue(){
            if currentElement < previousElement{
                return false
            }
            previousElement = currentElement
        }
    }
    return true
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    var queue = q
    var reversedQueue = Queue<T>()
    var arr = [T]()
    
    while !queue.isEmpty{
        if let currentElement = queue.dequeue(){
            arr.append(currentElement)
        }
    }
    
    while !arr.isEmpty {
        if let currentValue = arr.popLast(){
            reversedQueue.enqueue(currentValue)
        }
    }
    
    return reversedQueue
}

//5 Determine if two Queues are equal


func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var queueOne = qOne
    var queueTwo = qTwo
    
    while !queueOne.isEmpty && !queueTwo.isEmpty {
        guard let currentOne = queueOne.dequeue(), let currentTwo = queueTwo.dequeue()else { return false }
        if currentOne != currentTwo{
            return false
        }
    }
    return queueOne.isEmpty && queueTwo.isEmpty
}

