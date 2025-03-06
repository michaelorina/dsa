package main

import (
	"fmt"
)

func linearSearch(array []int, target int) int {
	for i, number := range array {
		if number == target {
			return i
		}
	}
	return -1
}

func main() {
	array := []int{1,2,3,4,5}
	var target int

	fmt.Print("Enter the number you want to search: ")
	fmt.Scan(&target)
	
	result := linearSearch(array, target)

	if result == -1 {
		fmt.Println("Element not found!")
	} else {
		fmt.Printf("Element found at index %d\n", result)
	}

}