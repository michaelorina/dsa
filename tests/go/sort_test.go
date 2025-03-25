package tests

import (
	"testing"
	"dsa/latest/sort/go" 
)

func TestBubbleSort(t *testing.T) {
	tests := []struct {
		input    []int
		expected []int
	}{
		{[]int{5, 3, 8, 4, 2}, []int{2, 3, 4, 5, 8}},
		{[]int{10, -1, 2, 5, 0}, []int{-1, 0, 2, 5, 10}},
		{[]int{1, 2, 3, 4, 5}, []int{1, 2, 3, 4, 5}}, // Already sorted
		{[]int{5, 4, 3, 2, 1}, []int{1, 2, 3, 4, 5}}, // Reverse sorted
		{[]int{42}, []int{42}},                        // Single element
		{[]int{}, []int{}},                            // Empty array
	}

	for _, test := range tests {
		arr := append([]int{}, test.input...) // Copy to avoid modifying test case data
		sort.BubbleSort(arr)
		for i, v := range arr {
			if v != test.expected[i] {
				t.Errorf("BubbleSort(%v) = %v; want %v", test.input, arr, test.expected)
				break
			}
		}
	}
}