#include <stdio.h>

int linear_search(int array[], int size, int target) {
    for (int i = 0; i < 5; i++) {
        if (array[i] == target) {
            return i;
        }
    }
    return -1;
}

int main() {
    int array[] = {10, 20, 30, 40, 50};
    int size = sizeof(array) / sizeof(array[0]);
    int target;

    printf("Enter the number you want to search: ");
    scanf("%d", &target);

    int result = linear_search(array, size, target);

    if (result != -1) {
        printf("Element found at index %d\n", result);
    } else {
        printf("Element not found!\n");
    }

    return 0;
}