def static_array():
    numbers = [None] * 5 
    return numbers

def dynamic_array():
    numbers = []
    for _ in range(5):
        numbers.append(None)
    return numbers