package main 

import (
	"fmt"
)

func staticArray() {
	var numbers [5]int 
	numbers[2] = 4
	numbers[4] = 7

	fmt.Println("Static Array:", numbers)
}

func dynamicArray() {
	numbers := []int{1, 2, 3}
	numbers = append(numbers, 4)

	fmt.Println("Dynamic Array:", numbers)
}

func main() {
	staticArray()
	dynamicArray()
}