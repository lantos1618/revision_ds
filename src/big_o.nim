import 
    tables, sequtils, strutils, strformat, math, sets, algorithm, times, os,
    unittest


suite "big_O":
    test "O(1)":
        proc first_element(arr: seq[int]): int =
            return arr[0]

        proc is_even(num: int): bool =
            return num mod 2 == 0

        proc get_key(dictionary: Table[string, string], key: string): string =
            return dictionary[key]

        check:
            first_element([1, 2, 3]) == 1
            is_even(2) == true
            get_key({"a": "b"}, "a") == "b"

    test "O(log n)":
        proc binary_search(arr: seq[int], target: int): int =
            var low = 0
            var high = len(arr) - 1
            
            while low <= high:              # O(log n)
                var mid = (low + high) div 2     # O(1)
                if arr[mid] == target:
                    return mid
                elif arr[mid] < target:
                    low = mid + 1
                else:
                    high = mid - 1
                    
            return -1

        check:
            binary_search([1, 2, 3, 4, 5], 3) == 2
            binary_search([1, 2, 3, 4, 5], 6) == -1

    test "O(n)":
        proc find_max(arr: seq[int]): int =
            var max_val = arr[0]
            for num in arr:       # O(n) 
                if num > max_val:
                    max_val = num
            return max_val

        proc count_occurrences(arr: seq[int], target: int): int =
            var count = 0
            for num in arr:    # O(n)
                if num == target:
                    count += 1
            return count
        
        check:
            find_max([1, 2, 3, 4, 5]) == 5
            count_occurrences([1, 2, 3, 4, 5, 1, 2, 3, 1], 1) == 3

    test "O(n log n)":
        proc merge(left, right: seq[int]): seq[int] =
            var i, j = 0
            while i < len(left) and j < len(right):     # O(n)
                if left[i] < right[j]:                 
                    result.add(left[i])
                    i += 1
                else:
                    result.add(right[j])
                    j += 1
                    
            result.add left[i..left.high]
            result.add right[j..right.high]
            
            return result
        proc mergesort(arr: seq[int]): seq[int] =
            if len(arr) <= 1:
                return arr
            
            var mid     = len(arr) div 2
            var left    = arr[0..mid]
            var right   = arr[mid..arr.high]
            
            left = mergesort(left)    # O(n log n)
            right = mergesort(right)
            
            return merge(left, right)
        check:
            mergesort([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
            mergesort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]
            mergesort([1, 3, 5, 2, 4]) == [1, 2, 3, 4, 5]


    test "O(n^2)":
        proc bubble_sort(arr: seq[int]): seq[int] =
            var n = arr.len()
            var result = arr
            for i in 0..n:              # O(n)
                for j in 0..(n-i-1):   # * O(n)
                    if result[j] > result[j+1]:
                        result[j]      = result[j+1]
                        result[j+1]    = result[j]
                        
        proc find_pairs(arr: seq[int], target: int): seq[(int, int)] =
            var result: seq[(int, int)]   = @[]
            var n                        = len(arr)
            for i in 0..n:          # O(n)
                for j in (i+1)..n: # * O(n)
                    if arr[i] + arr[j] == target:
                        result.add((arr[i], arr[j]))

    test "O(2^n)":

        proc all_subsets(arr: seq[int]): seq[seq[int]] =
            if arr.len() == 0:
                return
            
            var subsets = all_subsets(arr[1..arr.len])                  # O(2^n)
            # [[arr[0]] + subset for subset in subsets]
            for subset in subsets:
                result.add(@[arr[0]].concat(subset))

        check:
            all_subsets(@[1, 2, 3]) == [@[1, 2, 3], @[1, 2], @[1, 3], @[1], @[2, 3], @[2], @[3], @[]]
