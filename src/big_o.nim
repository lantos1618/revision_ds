import 
    tables,
    unittest


suite "big_O":
    test "O(1)":
        proc first_element(arr: seq[int]): int =
            return arr[0]

        proc is_even(num: int): bool =
            return num mod 2 == 0

        proc get_key(dict: Table[string, string], key: string): string =
            return dict[key]

        var tempTable = {"a": "b", "b": "c"}.toTable()
        check:
            first_element(@[1, 2, 3]) == 1
            is_even(2) == true
            tempTable.get_key("a") == "b"

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
            binary_search(@[1, 2, 3, 4, 5], 3) == 2
            binary_search(@[1, 2, 3, 4, 5], 6) == -1

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
            find_max(@[1, 2, 3, 4, 5]) == 5
            count_occurrences(@[1, 2, 3, 4, 5, 1, 2, 3, 1], 1) == 3

    test "O(n log n)":
        proc mergeSort(arr: seq[int]): seq[int] =
            # Base case: an empty or single-element array is already sorted
            if arr.len <= 1:
                return arr

            # Divide the array into two halves
            let mid = arr.len div 2
            let left = mergeSort(arr[0 ..< mid])
            let right = mergeSort(arr[mid ..< arr.len])

            # Merge the two halves
            var i = 0
            var j = 0
            var result: seq[int] = @[]
            while i < left.len and j < right.len:
                if left[i] < right[j]:
                    result.add(left[i])
                    inc i
                else:
                    result.add(right[j])
                    inc j

            # Append any remaining elements from the left or right half
            result.add(left[i ..< left.len])
            result.add(right[j ..< right.len])

            return result
        
        var 
            m_lsh_1 = mergeSort(@[1, 2, 3, 4, 5])
            m_lsh_2 = mergeSort(@[5, 4, 3, 2, 1])
            m_lsh_3 = mergeSort(@[1, 3, 5, 2, 4])
            m_rhs = @[1, 2, 3, 4, 5]

        check:
            m_lsh_1 == m_rhs
            m_lsh_2 == m_rhs
            m_lsh_3 == m_rhs


    test "O(n^2)":
        proc bubble_sort(arr: seq[int]): seq[int] =
            var n = arr.high

            result = arr
            for i in 0..<n:              # O(n)
                for j in 0..<(n-i):      # * O(n)
                    if result[j] > result[j+1]:
                        swap(result[j], result[j+1])
                        
        proc find_pairs(arr: seq[int], target: int): seq[(int, int)] =
            var n = arr.high
            for i in 0..<n:             # O(n)
                for j in (i+1)..<n:     # * O(n)
                    if arr[i] + arr[j] == target:
                        result.add((arr[i], arr[j]))

        var 
            b_lhs_1 = bubble_sort(@[1, 2, 3, 4, 5])
            b_lhs_2 = bubble_sort(@[5, 4, 3, 2, 1])
            b_lhs_3 = bubble_sort(@[1, 3, 5, 2, 4])
            b_rhs   = @[1, 2, 3, 4, 5]

            pairs_lhs = find_pairs(@[1, 2, 3, 4, 5], 5)
            pairs_rhs = @[(1, 4), (2, 3)]
        
        check:
            b_lhs_1 == b_rhs
            b_lhs_2 == b_rhs
            b_lhs_3 == b_rhs
            pairs_lhs == pairs_rhs
       

    test "O(2^n)":
        # Returns all subsets of the given sequence
        proc allSubsets(arr: seq[int]): seq[seq[int]] =
            # Base case: an empty sequence has only one subset, the empty set
            if arr.len == 0:
                # note to self result: seq[seq[int]] = @[] != @[@[]] but it is @[]
                return @[newSeq[int]()]

            # Recursive case: generate subsets that include the first element of the sequence
            var subsets = allSubsets(arr[1..arr.high])
            result = @[]
            for subset in subsets:
                result.add(subset)
                result.add(@[arr[0]] & subset)
            return result

        var
            sets_lhs = allSubsets(@[1, 2, 3])
            sets_rhs = @[@[], @[1], @[2], @[3], @[1, 2], @[1, 3], @[2, 3], @[1, 2, 3]]

        check:
            sets_lhs == sets_rhs

      