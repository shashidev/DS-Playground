/*

 Problem: Maximum Sum of a Subarray of Size K
 Given an array of integers and a number k, find the maximum sum of any contiguous subarray of size k.

 Example:
 plaintext
 Copy code
 Input:
 array = [2, 1, 5, 1, 3, 2]
 k = 3

 Output:
 9

 Explanation:
 The subarray with the maximum sum is [5, 1, 3], and its sum is 9.

 */


protocol SumOfSubarray {
    func sumOfSubarray(arr:[Int], ofSize k : Int )-> Int
}

protocol KadaneAlgorithem {
    func sumOfSubarray(arr:[Int])-> (sum:Int, subArray:[Int])
}




class SolutionUsingForLoop: SumOfSubarray {

    func sumOfSubarray(arr:[Int], ofSize k : Int )-> Int {
        var maxSum = 0

        for i in 0...arr.count - k {

            let currentSum = arr[i] + arr[i + 1] + arr[i + 2]

            maxSum = max(maxSum, currentSum)
        }
        return maxSum
    }
}


class SolutionUsingSlidingWindow : SumOfSubarray {

    func sumOfSubarray(arr:[Int], ofSize k : Int )-> Int {

        var maxSum = arr[0] + arr[1] + arr[2]
        var currentSum = maxSum

        for i in 1...arr.count - k {

            currentSum = (currentSum - arr[i - 1]) + arr[i + 2] 

            maxSum = findMax(maxSum, currentSum)

        }

        return maxSum
    }

    func findMax(_ x: Int, _ y: Int)-> Int {
        return x > y ? x : y
    }
}
class MaxSumOoAnySizeArray: KadaneAlgorithem {

    func sumOfSubarray(arr:[Int])-> (sum:Int, subArray:[Int]) {

        var maxSum = arr[0]
        var currentSum = arr[0]
        var startIndex = 0
        var endIndex = 0
        var tempStartIndex = 0
        var resultArray:[Int] = []


        for i in 1..<arr.count {
            if arr[i] > currentSum + arr[i] {
                currentSum = arr[i]
                tempStartIndex = i
            }else {
                currentSum += arr[i]
            }

            if currentSum > maxSum {
                maxSum = currentSum
                endIndex = i
                startIndex = tempStartIndex
            }
        }

        // Construct the result array including the endIndex
               for i in startIndex...endIndex { // Changed < to <=
                   resultArray.append(arr[i])
               }
        return(sum: maxSum, subArray: resultArray)
    }

}


let array = [2, 1, -1, 1, 3, 0]
//let solution:SumOfSubarray = SolutionUsingSlidingWindow()
//let sumOfSubarray = solution.sumOfSubarray(arr: array, ofSize: 3)
//print(sumOfSubarray)

let solution2:KadaneAlgorithem = MaxSumOoAnySizeArray()
let result = solution2.sumOfSubarray(arr: array)
print(result.sum)
print(result.subArray)




