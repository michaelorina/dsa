#include <stdlib.h>

void static_array() {
    int numbers[5];
}

void dynamic_array() {
    int *numbers = (int *)malloc(5 * sizeof(int));
    if (numbers == NULL) {
        return;
    }
    free(numbers);
}