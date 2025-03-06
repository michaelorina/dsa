def static_array():
    numbers = [0] * 5
    
    for i in range(5):
        numbers[i] = i + 1
    
    print("Static Array:", numbers)
    
def dynamic_array():
    numbers = []
    
    for i in range(5):
        numbers.append(i + 1)
    
    print ("Dynamic Array:", numbers)
    
def main():
    static_array()
    dynamic_array()

if __name__ == "__main__":
    main()