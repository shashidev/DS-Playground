//: [Previous](@previous)

import Foundation


//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//You can return the answer in any order.
//
//
//
//Example 1:
//
//Input: nums = [2,7,11,15], target = 9
//Output: [0,1]
//Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
//Example 2:
//
//Input: nums = [3,2,4], target = 6
//Output: [1,2]
//Example 3:
//
//Input: nums = [3,3], target = 6
//Output: [0,1]

protocol Sumable {
    func twoSum(nums:[Int], target: Int)-> [Int]
}

class Solution1: Sumable {
    func twoSum(nums:[Int], target: Int)-> [Int] {
        let length = nums.count
        for i in 0..<length {
            for j in i + 1..<length {
                if nums[i] + nums[j] == target {
                    return [i,j]
                }
            }
        }
        return []
    }
}

class Solution2: Sumable {
    func twoSum(nums: [Int], target: Int) -> [Int] {

        var dict = [Int:Int]()

        for (index, value) in nums.enumerated() {
            if let addend = dict[value] {
                print("[addend, index]: [ \(addend), \(index)]")
                return [addend, index]
            }else {

                dict[target - value] = index

            }
        }


        return []
    }

}


let test1 = [2,3,4,5]
let test2 = [2,5,6,7]
let solution:Sumable = Solution2()

let result = solution.twoSum(nums: test2, target: 9)
print(result)



