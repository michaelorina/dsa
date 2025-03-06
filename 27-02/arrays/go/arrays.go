package main

import (
	"fmt"
)

func staticArray() {
	var numbers [5]int
	numbers[2] = 3
	numbers[4] = 8
	fmt.Println("Static array:", numbers)
}

func dynamicArray() {
	numbers := []int{1, 2, 3}
	numbers = append(numbers, 4)
	fmt.Println("Dynamic array:", numbers)
}

func main() {
	staticArray()
	dynamicArray()
}
