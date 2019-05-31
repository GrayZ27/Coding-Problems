//  0066.Plus One.swift
//  Created by Gray Zhen on 5/31/19.

/*
 LeetCode problem - 1. Two Sum -- Difficulty Lv: Easy
 Problems: Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 
 Input: [1,2,9]
 Output: [1,3,0]
 Explanation: The array represents the integer 129.
 
 Input: [9,9,9]
 Output: [1,0,0,0]
 Explanation: The array represents the integer 999.
 
 Solution: the time complexity is O(n) where n is the length of the array.
 */

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        //copied digits into a new array.
        var result = digits
        //set the index to the last vaild index in the beginning.
        var index = result.count - 1
        //set the carry number to 0.
        var carry = 0
        //check whether the last digit is 9 or not.
        //if not, add 1 on the last digit. then done.
        if result[index] != 9 {
            result[index] += 1
        }else {
            //else, set the carry number to 1.
            //currently do nothing on index, since we have to plus one to the digits in the first place.
            carry = 1
            //keep doing while we carry a number and index is still vaild, else done.
            while carry != 0 && index >= 0{
                let sum = (result[index] + carry)
                result[index] = sum % 10
                carry = sum / 10
                index -= 1
            }
        }
        //Here, just in case the input array is [9,9], then the result is [0,0], and carry is 1.
        //so final check whether the carry is 0 or not.
        //if not, return [1]+result
        return carry == 0 ? result : [1]+result
    }
}

let solution = Solution()
let digitsOne = [1,2,3]
let resultOne = solution.plusOne(digitsOne)
print(resultOne)

let digitsTwo = [1,2,9]
let resultTwo = solution.plusOne(digitsTwo)
print(resultTwo)

let digitsThree = [9,9,9]
let resultThree = solution.plusOne(digitsThree)
print(resultThree)
