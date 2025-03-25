import unittest
from latest.sort.sort import bubble_sort

def test_bubble_sort():
    arr1 = [5, 3, 8, 4, 2]
    expected1 = [2, 3, 4, 5, 8]
    bubble_sort(arr1)
    assert arr1 == expected1

    arr2 = [10, -1, 2, 5, 0]
    expected2 = [-1, 0, 2, 5, 10]
    bubble_sort(arr2)
    assert arr2 == expected2
    
if __name__ == "__main__":
    unittest.main()
