def linear_search(array, target):
    for index, number in enumerate(array):
        if number == target:
            return index
    return -1

def binary_search(array, target):
    left, right = 0, len(array)
    
    while left < right:
        mid = left + (right - left) // 2
        
        if array[mid] == target:
            return mid
        elif array[mid] < target:
            left = mid + 1
        else:
            right = mid
        
    return -1