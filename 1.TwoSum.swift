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
*/

/*
The straightforward way is use the Nested for loop to find all the possible pairs. This way cost O(n^2) time complexity, so it is very slow when you have a big data set. The good thing is it takes only O(1) space complexity. If space complexity is more important, then it is not a bad idea to use this way.
 
 But for most of the solutions here, I will consider the time complexity more, so I will use the idea which is good for time complexity. If you have a better idea for both time and space complexities, please go to the original website and test it out.
 
 Since this array is not sorted, so we have to loop all the elements in the worst case when we cannot find a wanted pairs. so O(n) time complexity is a must. But when we loop through each number, how do we know their complementary number also in the array?
 Here is the best to use a dictionary to record each number and their index, and dictionary is comform to hashable, so it takes only O(1) to find a element.
 
 So the overall time complexity is O(n)
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

