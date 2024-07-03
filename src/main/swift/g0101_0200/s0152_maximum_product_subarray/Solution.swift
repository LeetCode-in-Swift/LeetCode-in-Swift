// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
// #Big_O_Time_O(N)_Space_O(1) #2024_07_03_Time_3_ms_(95.89%)_Space_15.5_MB_(81.96%)

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var maxProd = nums[0]
        var currentMax = nums[0]
        var currentMin = nums[0]
        
        for i in 1..<nums.count {
            let tempMax = currentMax
            let tempMin = currentMin
            
            currentMax = max(nums[i], max(tempMax * nums[i], tempMin * nums[i]))
            currentMin = min(nums[i], min(tempMax * nums[i], tempMin * nums[i]))
            
            maxProd = max(maxProd, currentMax)
        }
        
        return maxProd
    }
}
