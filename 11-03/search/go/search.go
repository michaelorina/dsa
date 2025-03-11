package search

import "math"

func LinearSearch(array []int, target int) int {
	for index, number := range array {
		if number == target {
			return index
		}
	}
	return -1
}

func BinarySearch(array []int, target int) int {
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

func TwoCrystalBalls(array []bool) int {
	n := len(array)
	if n == 0 {
		return -1
	}

	jump := int(math.Sqrt(float64(n)))
	i := 0

	for i < n && !array[i] {
		i += jump
	}

	start := i - jump
	if start < 0 {
		start = 0
	}

	for j := start; j < n; j++ {
		if array[j] {
			return j
		}
	}

	return -1
}
