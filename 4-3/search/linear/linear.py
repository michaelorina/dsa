def linear_search(array, target):
    for index, number in enumerate(array):
        if number == target:
            return index
        
    return -1

def main():
    array = [10, 20, 30, 40, 50]
    target = int(input("Enter the number you want to search: "))
    result = linear_search(array, target)
    
    if result != -1:
        print(f"Element found at index {result}")
    else:
        print("Element not found!")
        
if __name__ == "__main__":
    main()