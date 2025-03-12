#include <stdlib.h>

void static_array(int *numbers, int size) {
    for (int i = 0; i < size; i++) {
    numbers[i] = i + 1;
    }
}

int* dynamic_array(int size) {
    int *numbers = (int *)malloc(size * sizeof(int));
    if (numbers == NULL) {
        return NULL;
    }

    for (int i = 0; i < size; i++) {
        numbers[i] = i + 1;
    }
    return numbers;
}