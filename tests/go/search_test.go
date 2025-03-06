package tests

import (
	"testing"
	"dsa/latest/search/go" 
)

func TestLinearSearch(t *testing.T) {
	array := []int{1, 2, 3, 4, 5}

	tests := []struct {
		target   int
		expected int
	}{
		{3, 2},  
		{5, 4}, 
		{1, 0}, 
		{10, -1},
	}

	for _, test := range tests {
		result := search.LinearSearch(array, test.target)
		if result != test.expected {
			t.Errorf("LinearSearch(%v, %d) = %d; want %d", array, test.target, result, test.expected)
		}
	}
}

func TestBinarySearch(t *testing.T) {
	array := []int{1, 2, 3, 4, 5}

	tests := []struct {
		target   int
		expected int
	}{
		{3, 2}, 
		{5, 4}, 
		{1, 0},  
		{10, -1},
	}

	for _, test := range tests {
		result := search.BinarySearch(array, test.target)
		if result != test.expected {
			t.Errorf("BinarySearch(%v, %d) = %d; want %d", array, test.target, result, test.expected)
		}
	}
}
