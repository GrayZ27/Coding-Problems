//  0053.MaximumSubarray.swift
//  Created by Gray Zhen on 6/6/19.

/*
 LeetCode problem - 53. Maximum Subarray -- Difficulty Lv: Easy
 Problems: Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 
 Input: [-2,-1],
 Output: -1
 
 Input: [-1],
 Output: -1
 
 Solution: the overall time complexity is O(n) where n is the length of the array.
 */

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //make sure the nums is not empty.
        guard !nums.isEmpty else { return 0 }
        var sum = 0
        //make the largestSum to the first num in nums just in case the nums only has one element.
        var largestSum = nums[0]
        for num in nums {
            //get the max sum on current num and num+sum
            sum = max(num, sum+num)
            //get the largest sum from current sum and largestSum
            largestSum = max(sum, largestSum)
        }
        return largestSum
    }
}

let solution = Solution()
let numsOne = [-2,1,-3,4,-1,2,1,-5,4]
let resultOne = solution.maxSubArray(numsOne)
let numsTwo = [-2,-1]
let resultTwo = solution.maxSubArray(numsTwo)
let numsThree = [-1]
let resultThree = solution.maxSubArray(numsThree)
print(resultOne)
print(resultTwo)
print(resultThree)
