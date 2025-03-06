package main

import (
	"fmt"
)

func linearSearch(array []int, target int) int {
	for index, number := range array {
		if number == target {
			return index
		}
	}
	return -1
}

func main() {
	array := []int{10, 20, 30, 40, 50}
	var target int

	fmt.Print("Enter the number you want to search: ")
	fmt.Scan(&target)

	result := linearSearch(array, target)

	if result != -1 {
		fmt.Printf("Element found at index %d\n", result)
	} else {
		fmt.Println("Element not Found!")
	}
}