#include <stdlib.h>
#include <math.h>

int linear_search(int array[], int size, int target) {
    if (array == NULL || size <= 0) return -1;
    for (int i = 0; i < size; i++) {
        if (array[i] == target) return i;
    }
    return -1;
}

int binary_search(int array[], int size, int target) {
    if (array == NULL || size <= 0) return -1;

    int left = 0, right = size;

    while (left < right) {
        int mid = left + (right - left) / 2;

        if (array[mid] == target) return mid;
        else if (array[mid] < target) left = mid + 1;
        else right = mid;
    }
    return -1;
}

int two_crystal_balls(int array[], int size) {
    if (array == NULL || size <= 0) return -1;

    int jump = (int)sqrt(size);

    int i = 0;
    while (i < size && array[i] == 0) {
        i += jump;
    }

    int start = i - jump;
    for (int j = start; j <= i && j < size; j++) {
        if (array[j] == 1) return j;
    }
    return -1;
}