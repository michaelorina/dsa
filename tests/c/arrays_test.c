#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "../../latest/arrays/arrays.c"

void test_static_array() {
    int size = 5;
    int result[5];
    static_array(result, size);

    assert(result != NULL);
    assert(sizeof(result) / sizeof(result[0]) == size);
}

void test_dynamic_array() {
    int size = 5;
    int *result = dynamic_array(size);

    assert(result != NULL);

    for (int i = 0; i < size; i++) {
        result[i] = i;
    }

    free(result);
}

int main() {
    test_static_array();
    test_dynamic_array();
    return 0;
}
