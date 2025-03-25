package sort

func BubbleSort(arr []int) {
	n := len(arr)
	for i := range n-1 {
		for j := range n-i-1 {
			if arr[j] > arr[j+1] {
				arr[j], arr[j+1] = arr[j+1], arr[j]
			}
		}
	}
}