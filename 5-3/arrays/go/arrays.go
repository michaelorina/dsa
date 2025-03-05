package main

import (
	"fmt"
)

func staticArray() {
	numbers := [5]int{}
	fmt.Println(numbers)
}

func dynamicArray() {
	numbers := []int{}
	fmt.Println(numbers)
}