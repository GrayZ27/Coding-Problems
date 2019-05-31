//  0003.LongestSubstringWithoutRepeatingCharacters.swift
//  Created by Gray Zhen on 5/10/19.

/*
 LeetCode problem - 3. Longest Substring Without Repeating Characters -- Difficulty Lv: Medium
Given a string, find the length of the longest substring without repeating characters.
 

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */
import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        //if a string is empty or only one character, just return it's length.
        guard s.count > 1 else { return s.count }
        
        //to store a longest length.
        var length = 0
        //to store indexes for last occurrence of letters.
        var lettersLastOccur: [Character: Int] = [:]
        //let start and end for the range both begins with 0.
        var start = 0
        var end = 0
        
        //loop the whole string.
        for char in s {
            //if we found the last occurrence for the char, update it's index.
            if let indexAt = lettersLastOccur[char] {
                start = max(start, indexAt + 1)
            }
            //whether we found it's last occurrence or not, we have to update the current index.
            lettersLastOccur[char] = end
            end += 1
            //recalculate the length from start to end and update it
            length = max(length, end - start)
        }
        //return the longest length
        return length
    }
}

let solution = Solution()
let s = "abcabcbb"
let result = solution.lengthOfLongestSubstring(s)
print(result)


