#include <assert.h>
#include "../../latest/sort/sort.c"

void test_bubble_sort() {
    int arr1[] = {5, 3, 8, 4, 2};
    int expected1[] = {2, 3, 4, 5, 8};
    bubble_sort(arr1, 5);
    for (int i = 0; i < 5; i++) {
        assert(arr1[i] == expected1[i]);
    }

    int arr2[] = {10, -1, 2, 5, 0};
    int expected2[] = {-1, 0, 2, 5, 10};
    bubble_sort(arr2, 5);
    for (int i = 0; i < 5; i++) {
        assert(arr2[i] == expected2[i]);
    }
}

int main() {
    test_bubble_sort();
}