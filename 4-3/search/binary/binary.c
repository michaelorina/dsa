#include <stdio.h>

int binary_search(int array[], int n, int target) {
    int left = 0, right = n;

    while (left < right) {
        int mid = left + (right - left) / 2;

        if (array[mid] == target) 
            return mid;
        else if (array[mid] < target)
            left = mid + 1;
        else
            right = mid;
    }

    return -1;
}

int main() {
    int arr[] = {10, 20, 30, 40, 50, 60, 70};
    int n = sizeof(arr) / sizeof(arr[0]);
    int target = 30;

    int result = binary_search(arr, n, target);
    if (result != -1)
        printf("Element found at index %d\n", result);
    else
        printf("Element not found\n");

    return 0;
}