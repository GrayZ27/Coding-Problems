//  2.AddTwoNumbers.swift
//  Created by Gray Zhen on 5/1/19.

/*
 LeetCode problem - 2. Add Two Numbers -- Difficulty Lv: Medium
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4 -> 7)
 Output: 7 -> 0 -> 8 -> 7
 Explanation: 342 + 7465 = 7807.
 
 Solution: the overall time complexity is O(n), where n is the longest list in two non-empty linked lists.
 */

import Foundation

//A class for ListNode contains two variables and an initializer
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//extend the ListNode to conform CustomStringCvertible
//so we can make the description for a list is more easy to read.
extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(val)"}
        return "\(val) -> " + String(describing: next) + ""
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //create a tuples to hold two current nodes locations for two lists
        //I need to change them later so I use var here
        var (currLoca1, currLoca2) = (l1, l2)
        
        //create a first node and return it.
        //This node is the first node and I don't want change it after set.
        let result = ListNode((currLoca1!.val + currLoca2!.val) % 10)
        
        //since the result is the first node, so we can set our current node is result.
        var current = result
        //carry is a variable to handle when the sum of two nodes's values is more than one digits.
        var carry = (currLoca1!.val + currLoca2!.val) / 10
        
        //update two nodes's locations to next since we alreay use the current nodes to find the first node.
        (currLoca1, currLoca2) = (currLoca1?.next, currLoca2?.next)
        
        //loop both lists until they are both pointing to nil.
        while currLoca1 != nil || currLoca2 != nil {
            //exact values from both nodes, value is 0 when current node has no vlaue.
            let val1 = currLoca1?.val ?? 0
            let val2 = currLoca2?.val ?? 0
            
            //find the sum of two current nodes and check if they have crray number or not.
            let sum = (val1 + val2 + carry) % 10
            carry = (val1 + val2 + carry) / 10
            
            //update locations again.
            (currLoca1, currLoca2) = (currLoca1?.next, currLoca2?.next)
            
            //create a node and link it to current node and update the current node.
            //current node is always the last node after we appended a new node to the list.
            let next = ListNode(sum)
            current.next = next
            current = next
        }
        
        //after we looped both lists, if carry exists, append it to the list.
        if carry > 0 {
            current.next = ListNode(carry)
        }
        return result
    }
}

//Example
let listOne3 = ListNode(3)
let listOne2 = ListNode(4)
let listOne1 = ListNode(2)
listOne1.next = listOne2
listOne2.next = listOne3

let listTwo4 = ListNode(7)
let listTwo3 = ListNode(4)
let listTwo2 = ListNode(6)
let listTwo1 = ListNode(5)
listTwo1.next = listTwo2
listTwo2.next = listTwo3
listTwo3.next = listTwo4

let solution = Solution()
if let result = solution.addTwoNumbers(listOne1, listTwo1){
    print(result)
}
