//  14.LongestCommonPrefix.swift
//  Created by Gray Zhen on 5/14/19.

/*
 LeetCode problem - 14. Longest Common Prefix -- Difficulty Lv: Easy
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".
 
 Note: All given inputs are in lowercase letters a-z.
 
 Example:
 Input: ["flower","flow","flight"]
 Output: "fl"
 
 Solution: it takes O(n) to find the shortest string in the array, where n is the length of the array.
 and then it take O(m * n) to find the prefix, where m is the length of the shortest string.
 the overall time complexity is f(n) = mn + n, which is O(mn).
 */

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        //if the array is empty, then return "".
        guard !strs.isEmpty else { return "" }
        
        //if the array has only one string, return it.
        guard strs.count != 1 else { return strs[0] }
        
        //find the shortest string in the array, and set it to longest prefix.
        //the time complexity is O(n).
        var lPrefix = strs[0]
        for s in strs{
            if lPrefix.count > s.count {
                lPrefix = s
            }
        }
        
        //test the longest prefix is the prefix for other strings. return it if it is.
        //if it is not, remove the last character and test it again until the longest prefix string is empty.
        //the time complexity is O(m * n).
        while lPrefix.count > 0 {
            //create a boolean variable to keep track the prefix while checking with other strings.
            var isPrefix = true
            for s in strs {
                //once found the prefix check is failed, remove the last character,
                //set the boolen to false and exit the inner for-in loop.
                if !s.hasPrefix(lPrefix) {
                    lPrefix.removeLast()
                    isPrefix = false
                    break
                }
            }
            //if the isPrefix still true after the for-in loop finished,
            //then it is the prefix of all other strings, just return it.
            if isPrefix {
                return lPrefix
            }
        }
        
        //can't find a prefix in common, then return an empty string.
        return ""
    }
}


let solution = Solution()
let a = ["flower","flow","flight"]
let longestPrefix = solution.longestCommonPrefix(a)
print(longestPrefix)

