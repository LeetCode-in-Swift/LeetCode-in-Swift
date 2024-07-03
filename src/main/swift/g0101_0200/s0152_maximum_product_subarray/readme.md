152\. Maximum Product Subarray

Medium

Given an integer array `nums`, find a contiguous non-empty subarray within the array that has the largest product, and return _the product_.

It is **guaranteed** that the answer will fit in a **32-bit** integer.

A **subarray** is a contiguous subsequence of the array.

**Example 1:**

**Input:** nums = [2,3,-2,4]

**Output:** 6

**Explanation:** [2,3] has the largest product 6. 

**Example 2:**

**Input:** nums = [-2,0,-1]

**Output:** 0

**Explanation:** The result cannot be 2, because [-2,-1] is not a subarray. 

**Constraints:**

*   <code>1 <= nums.length <= 2 * 10<sup>4</sup></code>
*   `-10 <= nums[i] <= 10`
*   The product of any prefix or suffix of `nums` is **guaranteed** to fit in a **32-bit** integer.

To solve the problem of finding the maximum product subarray in Swift using a `Solution` class, follow these steps:

1. **Define the Solution Class**: Create a Swift class named `Solution` where you'll implement the solution.

2. **Initialize the Function**: Inside the `Solution` class, define a function `maxProduct` that takes an array of integers (`nums`) as input and returns an integer representing the maximum product of any contiguous subarray.

3. **Edge Case Handling**: Check if the input array `nums` is empty or nil. If so, return 0 or handle accordingly based on the problem requirements.

4. **Initialize Variables**:
   - `maxProd`: This variable will track the maximum product found so far among all subarrays.
   - `currentMax`: This variable will track the maximum product ending at the current position in the array.
   - `currentMin`: This variable will track the minimum product ending at the current position in the array.
   - Start with `maxProd` initialized to `nums[0]` because initially, the maximum product subarray might just be the first element.

5. **Iterate Through Array**: Loop through the array starting from the second element (index 1):
   - Update `currentMax` and `currentMin` based on whether the current element is positive or negative.
   - Update `currentMax` by taking the maximum of `nums[i]`, `currentMax * nums[i]`, or `currentMin * nums[i]`.
   - Update `currentMin` by taking the minimum of `nums[i]`, `currentMax * nums[i]`, or `currentMin * nums[i]`.
   - Update `maxProd` to be the maximum of itself and `currentMax`.

6. **Return the Result**: After iterating through the array, `maxProd` will contain the maximum product of any contiguous subarray. Return `maxProd` as the result.

Here's how the Swift code implementation would look:

```swift
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
```

**Explanation of the Code**:
- We use `currentMax` and `currentMin` to keep track of the maximum and minimum products of subarrays ending at the current element `nums[i]`.
- `maxProd` is updated to store the maximum product found so far as we iterate through the array.
- The `max()` and `min()` functions help in updating `currentMax` and `currentMin` respectively based on the current element and previous products.
- Finally, `maxProd` holds the maximum product subarray found by the end of the loop, which is returned as the result.

This implementation efficiently finds the maximum product subarray in O(n) time complexity, where n is the length of the `nums` array, which meets the problem's constraints effectively.