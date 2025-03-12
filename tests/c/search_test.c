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

void test_two_crystal_balls() {
    int arr1[] = {0, 0, 0, 0, 1, 1, 1};
    assert(two_crystal_balls(arr1, 7) == 4);

    int arr2[] = {0, 0, 0, 0, 0, 0, 0};
    assert(two_crystal_balls(arr2, 7) == -1);

    int arr3[] = {1, 1, 1, 1, 1};
    assert(two_crystal_balls(arr3, 5) == 0);

    int arr4[] = {0, 0, 0, 1, 1, 1};
    assert(two_crystal_balls(arr4, 6) == 3);

    int arr5[] = {0, 1, 1, 1, 1};
    assert(two_crystal_balls(arr5, 5) == 1);

    int arr6[] = {0};
    assert(two_crystal_balls(arr6, 0) == -1);

    int *arr7 = NULL;
    assert(two_crystal_balls(arr7, 0) == -1);

    int arr8[] = {0, 0, 0, 0, 0, 1};
    assert(two_crystal_balls(arr8, 6) == 5);

    int arr9[] = {0, 0, 1};
    assert(two_crystal_balls(arr9, 3) == 2);
}

int main() {
    test_linear_search();
    test_binary_search();
    test_two_crystal_balls();
    return 0;
}
