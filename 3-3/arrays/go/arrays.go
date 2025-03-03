package main

import (
	"fmt"
)

func staticArray() {
	var numbers [5]int

	for i := 0; i < 5; i++ {
		numbers[i] = i + 1
	}

	fmt.Println("Static Array:", numbers)

}

func dynamicArray() {
	var numbers []int

	for i := 0; i < 5; i++ {
		numbers = append(numbers, i + 1)
	}

	fmt.Println("Dynamic Array:", numbers)
}

func main() {
	staticArray()
	dynamicArray()
}