//  0268.MissingNumber.swift
//  Created by Gray Zhen on 7/9/19.

/*
 LeetCode problem - 268. Missing Number -- Difficulty Lv: Easy
 Problems: Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 
 Note: Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 
 Example:
 Input: [3,0,1]
 Output: 2
 
 Example:
 Input: [9,6,4,2,3,5,7,0,1]
 Output: 8
 
 Solution: the overall time complexity is O(n) where n is the length of the array.
 */

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        
        //----------------------------Solution 3---------------------------------
        //---------------Using higher order function: Reduce to solve------------
        
        return nums.reduce(nums.count*(nums.count+1)/2, {sum,number in
            sum - number
        })
        
        //----------------------------Solution 2---------------------------------
        //-----------------------Find formula for the sum -----------------------
        // //n(n+1) / 2 is the formula to find the sum from 1 up to n.
        // var amount = nums.count*(nums.count+1)/2
        // for n in nums {
        //     amount -= n
        // }
        // return amount
        
        //----------------------------Solution 1---------------------------------
        //         //count the sum of the array.
        //         var sum = 0
        //         //find the total from 0 up to n
        //         var total = 0
        //         var counter = 1
        
        //         for n in nums {
        //             sum += n
        //             total += counter
        //             counter += 1
        //         }
        //         //the difference between total and sum is the missing number
        //         return total - sum
    }
}
