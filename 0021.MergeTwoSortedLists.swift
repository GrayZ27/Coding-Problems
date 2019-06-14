//  0021.MergeTwoSortedLists.swift
//  Created by Gray Zhen on 6/14/19.

/*
 LeetCode problem - 21. Merge Two Sorted Lists -- Difficulty Lv: Easy
 Problems: Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 
 Solution: the overall time complexity is O(m+n) where m and n are the lengths of two lists.
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        elf.next = nil
    }
}

class Solution {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //make sure both lists are not emtpy, if either one empty, just return other one.
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        
        //copy l1 and l2 to local variables l1Node and l2Node
        var (l1Node, l2Node) = (l1,l2)
        
        //create a void node to hold the first position,
        //and return voidNode.next as the first node of the new list.
        var voidNode = ListNode(0)
        //create a currentNode to keep track of the last node on the new list.
        var currentNode = voidNode
        
        //create a nested func to reduce duplicate codes.
        func appendNode(_ node: inout ListNode?) {
            currentNode.next = node
            currentNode = node!
            node = node?.next
        }
        
        //compare vals when both nodes are not nil, and append the smaller one to new list.
        while l1Node != nil || l2Node != nil {
            if let node1 = l1Node, let node2 = l2Node {
                if node1.val <= node2.val {
                    appendNode(&l1Node)
                }else if node1.val > node2.val {
                    appendNode(&l2Node)
                }
            }else if let node1 = l1Node {
                appendNode(&l1Node)
            }else if let node2 = l2Node {
                appendNode(&l2Node)
            }
        }
        
        return voidNode.next
    }
}

//Example check
let l1NodeOne = ListNode(1)
let l1NodeTwo = ListNode(2)
let l1NodeThree = ListNode(4)
l1NodeOne.next = l1NodeTwo
l1NodeTwo.next = l1NodeThree

let l2NodeOne = ListNode(1)
let l2NodeTwo = ListNode(3)
let l2NodeThree = ListNode(4)
l2NodeOne.next = l2NodeTwo
l2NodeTwo.next = l2NodeThree

let s = Solution()
let newList = s.mergeTwoLists(l1NodeOne, l2NodeOne)
//If you run the code outside leecode, the output shoulb be "Optional(ListNode.ListNode)"
//To see the result just like the output from LeeCode, [1,1,2,3,4,4],
//you can conforms the Solution class to protocol CustomStringConvertible,
//and custom your own output style.
print(newList)
