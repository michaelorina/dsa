def linear_search(array, target):
    for index, value in enumerate(array):
        if value == target:
            return index
    return -1

def main():
    array = [1, 2, 3, 4, 5]
    target = int(input("Enter the number you want to search: "))
    result = linear_search(array, target)
    
    if result == -1:
        print("Element not found!")
    else:
        print(f"Element found at index {result}")
        
if __name__ == "__main__":
    main()