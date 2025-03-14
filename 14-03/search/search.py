import math

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

def two_crystal_balls(array):
    n = len(array)
    jump = int(math.sqrt(n)) 
    
    i = 0
    while i < n and not array[i]:
        i += jump
    
    start = max(0, i - jump)
    for j in range(start, min(i + 1, n)):
        if array[j]:
            return j
    return -1