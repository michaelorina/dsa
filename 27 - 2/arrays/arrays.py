def static_array():
    numbers = [0] * 5
    
    for i in range(5):
        numbers[i] = i + 1
    
    return numbers

def dynamic_array():
    numbers = []
    for i in range(5):
        numbers.append(i + 1)
    
    return numbers

def main():
    print("Static Array:", static_array())
    print("Dynamic Aray:", dynamic_array())
    
if __name__ == "__main__":
    main()