package sort

func BubbleSort(array []int) {
	n := len(array)
	for i := range n - 1 {
		for j := range n - i - 1 {
			if array[j] > array[j + 1] {
				array[j], array[j + 1] = array[j + 1], array[j]
			}
		}
	}
}