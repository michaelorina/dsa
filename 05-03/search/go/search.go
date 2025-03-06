package main

func linearSearch(array []int, target int) int {
	for index, number := range array {
		if number == target {
			return index
		}
	}
	return -1
}

func binarySearch(array []int, target int) int {
	left, right := 0, len(array)

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