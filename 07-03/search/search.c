#include <stdlib.h>

int linear_search(int array[], int size, int target) {
    if (array == NULL || size == 0) {
        return -1;
    }

    for (int i = 0; i < size; i++) {
        if (array[i] == target) {
            return i;
        }
    }
    return -1;
}

int binary_search(int array[], int size, int target) {
    if (array == NULL || size == 0) {
        return -1;
    }
    
    int left = 0, right = size;

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
