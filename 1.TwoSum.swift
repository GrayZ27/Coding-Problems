//
//  1.TwoSum.swift
//  
//
//  Created by Gray Zhen on 4/30/19.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numWithIndex: [Int : Int] = [ : ]
        for i in 0..<nums.count{
            let complementNum = target - nums[i]
            if let index = numWithIndex[complementNum]{
                return [index, i]
            }else {
                numWithIndex[nums[i]] = i
            }
        }
        return []
    }
}

let sum = Solution()
let nums = [2, 7, 11, 15]
let target = 9
let result = sum.twoSum(nums, target)
print(result)
