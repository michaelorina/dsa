#include <stdio.h>
#include <stdlib.h>

void staticArray() {
    int numbers[5] = {1, 2, 3, 4, 5};

    printf("Static Array: ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", numbers[i]);
    }
    printf("\n");
}

void dynamicArray() {
    int *numbers = (int *)malloc(5 * sizeof(int));
    if (numbers == NULL) {
        return;
    }

    for (int i = 0; i < 5; i++) {
        numbers[i] = i + 1;
    }

    printf("Dynamic Array: ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", numbers[i]);
    }

    printf("\n");

    free(numbers);

}

int main () {
    staticArray();
    dynamicArray();

    return 0;
}