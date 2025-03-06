#include <stdio.h>
#include <stdlib.h>

void staticArray() {
    int numbers[5] = {1, 2, 3, 4, 5};
    printf("First element: %d\n", numbers[0]);

    numbers[3] = 10;
    printf("Modified fourth element: %d\n", numbers[3]);
}

void dynamicArray() {
    int *numbers = (int *)malloc(5 * sizeof(int));
    if (numbers == NULL) {
        return;
    }

    for (int i = 0; i < 5; i++) {
        numbers[i] = i + 1;
    }

    printf("Dynamic array: ");
    for (int i = 0; i < 5; i++) {
        printf("%d\n", numbers[i]);
    }

    printf("\n");

    free(numbers);

}

int main() {

    staticArray();
    dynamicArray();

    return 0;

}