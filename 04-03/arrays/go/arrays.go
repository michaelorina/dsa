package main

import (
	"fmt"
)

func staticArray() {

	var numbers [5]int

	for i := range 5 {
		numbers[i] = i + 1
	}

	fmt.Println("Static Array:", numbers)

}

func dynamicArray() {

	var numbers []int

	for i := range 5 {
		numbers = append(numbers, i + 1)
	}

	fmt.Println("Dynamic Array:", numbers)
}

func main() {
	staticArray()
	dynamicArray()
}
