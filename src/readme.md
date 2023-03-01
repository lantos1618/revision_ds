


Datastructures and Algorithms recap

- [] Big O
- [] Arrays
- [] Linked Lists
- [] Trees
- [] Stacks
- [] Queues
- [] Hash Tables
- [] Graphs
- [] Sorting Algorithms
- [] Searching Algorithms
- [] Dynamic Programming
- [] Greedy Algorithms
- [] Recursion
- [] Bit Manipulation
- [] Memory (Stack vs Heap)


# Big O
- Big O = order of magnitude
<Table>
    <tr>
        <td>
            <h3>Notation</h3>
        </td>
        <td>
            <h3>Big O</h3>
        </td>
        <td>
            Explanation
        </td>
        <td>
            Examples
        </td>
    </tr>
    <tr>
        <td>
            <p>Constant</p>
        </td>
        <td>
            <p>O(1)</p>
        </td>
        <td>
            This represents constant time complexity, where the time required to execute an algorithm is constant regardless of the size of the input. For example, accessing an element in an array or a dictionary is O(1) because it takes the same amount of time to access an element regardless of the size of the array or dictionary.
        </td>
        <td>
            <li>Accessing an element in an array or a dictionary</li>
            <li>Checking if a number is even or odd</li>
            <li>Returning the first element of a linked list</li>
        </td>
    </tr>
    <tr>
        <td>
            <p>Logarithmic</p>
        </td>
        <td>
            <p>O(log n)</p>
        </td>
        <td>
        This represents logarithmic time complexity, where the time required to execute an algorithm increases logarithmically with the size of the input. For example, binary search has a time complexity of O(log n) because the search space is divided in half with each iteration.
        </td>
        <td>
            <li>Binary search in a sorted array</li>
            <li>Finding an element in a balanced binary search tree</li>
            <li>Finding the shortest path between two nodes in a graph using Dijkstra's algorithm</li>
        </td>
    </tr>
    <tr>
        <td>
            <p>Linear</p>
        </td>
        <td>
            <p>O(n)</p>
        </td>
        <td>
       This represents linear time complexity, where the time required to execute an algorithm increases linearly with the size of the input. For example, iterating through an array or a list is O(n) because the time required to iterate through each element increases linearly with the size of the array or list.
        </td>
        <td>
            <li>Iterating through an array or a list</li>
            <li>Finding the maximum or minimum element in an unsorted array</li>
            <li>Counting the number of occurrences of an element in an array</li>
        </td>
    </tr>
    <tr>
        <td>
            <p>Linearithmic</p>
        </td>
        <td>
            <p>O(n log n)</p>
        </td>
        <td>
        This represents quasi-linear time complexity, where the time required to execute an algorithm increases in proportion to the size of the input multiplied by the logarithm of the input size. For example, quicksort and mergesort have a time complexity of O(n log n).
        </td>
        <td>
            <li>Sorting an array using quicksort or mergesort</li>
            <li>Building a binary search tree from a sorted array</li>
            <li>Computing the convex hull of a set of points using Graham's scan</li>
        </td>
    </tr>
    <tr>
        <td>
            <p>Quadratic</p>
        </td>
        <td>
            <p>O(n^2)</p>
        </td>
        <td>
        This represents quadratic time complexity, where the time required to execute an algorithm increases in proportion to the square of the size of the input. For example, nested loops that iterate over an array or a matrix have a time complexity of O(n^2).
        </td>
        <td>
            <li>Bubble sort, insertion sort, or selection sort</li>
            <li>Finding all pairs of elements in an array that sum to a target value</li>
            <li>Multiplying two n x n matrices using the naive algorithm</li>
        </td>
    </tr>
    <tr>
        <td>
            <p>Eponential</p>
        </td>
        <td>
            <p>O(2^n)</p>
        </td>
        <td>
        This represents exponential time complexity, where the time required to execute an algorithm doubles with each additional input. For example, solving the traveling salesman problem using brute force has a time complexity of O(2^n) because the number of possible routes grows exponentially with the number of cities.
        </td>
        <td>
            <li>Solving the traveling salesman problem using brute force</li>
            <li>Finding all subsets of a set using recursion</li>
            <li>Enumerating all possible combinations of a set of items.</li>
        </td>
    </tr>
    <tr>
        <td>
            <p>Factorial</p>
        </td>
        <td>
            <p>O(n!)</p>
        </td>
        <td>
        This represents factorial time complexity, where the time required to execute an algorithm increases in proportion to the factorial of the size of the input. For example, solving the traveling salesman problem using brute force has a time complexity of O(n!) because the number of possible routes grows exponentially with the number of cities.
        </td>
        <td>
            Finding all permutations of a set of n elements. This requires generating n! possible permutations, which grows very quickly with n. For example, if n=10, there are 3,628,800 possible permutations. This makes brute-force algorithms impractical for large values of n.
        </td>
    </tr>
</Table>

## Examples 

O(1):

```py
def first_element(array):
    return array[0]

def is_even(num):
    return num % 2 == 0

def get_key(dictionary, key):
    return dictionary.get(key)
```

O(log n):

```py
def binary_search(array, target):
    low = 0
    high = len(array) - 1
    
    while low <= high:
        mid = (low + high) // 2
        if array[mid] == target:
            return mid
        elif array[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
            
    return -1
```

O(n):

```py
def find_max(array):
    max_val = array[0]
    for num in array:
        if num > max_val:
            max_val = num
    return max_val

def count_occurrences(array, target):
    count = 0
    for num in array:
        if num == target:
            count += 1
    return count
```

O(n log n):

```py
def mergesort(array):
    if len(array) <= 1:
        return array
    
    mid = len(array) // 2
    left = array[:mid]
    right = array[mid:]
    
    left = mergesort(left)
    right = mergesort(right)
    
    return merge(left, right)
    
def merge(left, right):
    result = []
    i = j = 0
    
    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
            
    result += left[i:]
    result += right[j:]
    
    return result
```

O(n^2):

```py
def bubble_sort(array):
    n = len(array)
    for i in range(n):
        for j in range(0, n-i-1):
            if array[j] > array[j+1]:
                array[j], array[j+1] = array[j+1], array[j]
                
def find_pairs(array, target):
    pairs = []
    n = len(array)
    for i in range(n):
        for j in range(i+1, n):
            if array[i] + array[j] == target:
                pairs.append((array[i], array[j]))
    return pairs
```

O(2^n):

```py
def all_subsets(array):
    if len(array) == 0:
        return [[]]
    
    subsets = all_subsets(array[1:])
    return subsets + [[array[0]] + subset for subset in subsets]