//  0088.MergeSortedArray.swift
//  Created by Gray Zhen on 6/21/19.

/*
 LeetCode problem - 88. Merge Sorted Array -- Difficulty Lv: Easy
 Problems: Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.

 Hint:
 What if you fill the longer array from the end instead of start ?
 
 Example:
 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 Output: [1,2,2,3,5,6]
 
 Solution: the overall time complexity is O(m+n).
 */


import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        //create a currentIndex to hold the current index of the merged nums 1.
        var currentIndex = m + n - 1
        //create two index to hold two index on nums 1 and nums 2.
        var index1 = m - 1
        var index2 = n - 1
        
        //create two nested func to reduce the same code.
        func updateNums1() {
            nums1[currentIndex] = nums1[index1]
            currentIndex -= 1
            index1 -= 1
        }
        
        func updateNums2() {
            nums1[currentIndex] = nums2[index2]
            currentIndex -= 1
            index2 -= 1
        }
        
        
        while index1 >= 0 && index2 >= 0 {
            if nums1[index1] == nums2[index2] {
                updateNums1()
                updateNums2()
            }else if nums1[index1] > nums2[index2]{
                updateNums1()
            }else {
                updateNums2()
            }
        }
        
        while index2 >= 0 {
            updateNums2()
        }
    }
}
