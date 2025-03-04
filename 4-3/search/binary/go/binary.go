package main

import (
	"fmt"
)

func binarySearch(array []int, target int) int {
	left, right := 0, len(array) - 1

	for left < right {
		mid := left + (right - left) / 2

		if array[mid] == target {
			return mid
		} else if array[mid] < target {
			left = mid + 1
		} else {
			right = mid
		}
	}

	return -1
}

func main() {
	array := []int{10, 20, 30, 40, 50, 60, 70}
	target := 30

	result := binarySearch(array, target)

	if result != -1 {
		fmt.Printf("Element found at index %d\n", result)
	} else {
		fmt.Println("Element not found!")
	}
}