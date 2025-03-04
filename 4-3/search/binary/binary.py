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

def main():
    array = [10, 20, 30, 40, 50, 60, 70]
    target = 30

    result = binary_search(array, target)
    print(f"Element found at index {result}" if result != -1 else "Element not found")
    
if __name__ == "__main__":
    main()