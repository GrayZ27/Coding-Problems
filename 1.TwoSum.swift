//  1.TwoSum.swift
//  Created by Gray Zhen on 4/30/19.

/*
 LeetCode problem - 1. Two Sum -- Difficulty Lv: Easy
 Problems: Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 Tips: You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 Solution: the overall time complexity is O(n) where n is the length of the array.
*/

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //create a empty dictionary to store [number: index]
        var numWithIndex: [Int : Int] = [ : ]
        //loop through each element
        for i in 0..<nums.count{
            //find its complementary number
            let complementNum = target - nums[i]
            //if the complementray already in the dictionary,
            //then return the current number index and its complementray index
            if let index = numWithIndex[complementNum]{
                return [index, i]
            }else {
                //else add the complementary number to the dictionary
                numWithIndex[nums[i]] = i
            }
        }
        //finally, if we cannot find a wanted pairs, just return an empty array.
        return []
    }
}

let sum = Solution()
let nums = [2, 7, 11, 15]
let target = 9
let result = sum.twoSum(nums, target)
print(result)

