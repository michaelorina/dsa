#include <assert.h>
#include "../../latest/search/search.c"

void test_linear_search() {
    int arr1[] = {1, 2, 3, 4, 5};
    int size1 = 5;

    assert(linear_search(arr1, size1, 3) == 2);  
    assert(linear_search(arr1, size1, 1) == 0);  
    assert(linear_search(arr1, size1, 5) == 4);  
    assert(linear_search(arr1, size1, 10) == -1); 
    assert(linear_search(arr1, size1, -3) == -1);

    int *arr2 = NULL;
    assert(linear_search(arr2, 0, 5) == -1);

}

void test_binary_search() {
    int arr1[] = {1, 2, 3, 4, 5};
    int size1 = 5;

    assert(binary_search(arr1, size1, 3) == 2); 
    assert(binary_search(arr1, size1, 1) == 0);  
    assert(binary_search(arr1, size1, 5) == 4); 
    assert(binary_search(arr1, size1, 10) == -1); 
    assert(binary_search(arr1, size1, -3) == -1);

    int *arr2 = NULL;
    assert(binary_search(arr2, 0, 5) == -1);

}

int main() {
    test_linear_search();
    test_binary_search();
    return 0;
}
