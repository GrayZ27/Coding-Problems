//  7.ReverseInteger.swift
//  Created by Gray Zhen on 5/3/19.

/*
 LeetCode problem - 7. Reverse Integer -- Difficulty Lv: Easy
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 
 Example:
 Input: 123
 Output: 321
 */

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        //create a absolute value for x, so no worry about the sign during reversing.
        var absX = abs(x)
        //create a variable reversedNum to store while reversing.
        var reversedNum = 0
        while absX > 0 {
            //everytime we times the result by 10 and add the last digit from absX.
            reversedNum = reversedNum * 10 + absX % 10
            //remove the last digit from absX
            absX /= 10
            
            //Here to handle the environment only store 32-bit signed integer.
            //return 0 when the reversed number overflows.
            //once detected the number overflowed during reversing,
            //  the funtion can early exit and skip the rest of remaining digits.
            if x>=0 && reversedNum > Int32.max { return 0 }
            if x<0 && -reversedNum < Int32.min { return 0 }
        }
        //use a ternary operator to return a negative reversed number if x is negative,
        //  else just return the normal reversedNum.
        return x >= 0 ? reversedNum : -reversedNum
    }
}

let solution = Solution()
let reversedNumber = solution.reverse(123)
print(reversedNumber)
