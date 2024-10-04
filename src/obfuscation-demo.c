#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
    // Check if a pointer is null
    int *ptr = NULL;

    // Use a const that can be split
    const int part1 = 2;
    const int part2 = 3;
    const int arraySize = part1 + part2; // 5

    // Use a fixed-size array
    int array[5] = {1, 2, 3, 4, 5};

    // Use an array that can be split
    int firstHalf[part1];
    int secondHalf[part2];

    // Splitting the array into two
    for(int i = 0; i < part1; i++) {
        firstHalf[i] = array[i];
    }
    for(int i = 0; i < part2; i++) {
        secondHalf[i] = array[i + part1];
    }

    // Use two arrays that can be merged into one
    int mergedArray[arraySize];
    for(int i = 0; i < part1; i++) {
        mergedArray[i] = firstHalf[i];
    }

    for(int i = 0; i < part2; i++) {
        mergedArray[i + part1] = secondHalf[i];
    }

    // Use a string
    char greeting[] = "Calculating sum of array elements!";
    printf("%s\n", greeting);

    // Use a for loop to calculate the sum
    int sum = 0;
    for (int i = 0; i < arraySize; i++) {
        sum += mergedArray[i];
    }

    // Use the equivalent of a JNE (if the sum is not equal to 0)
    if (sum != 0) {
        printf("Sum of array elements is %d\n", sum);
    } else {
        printf("Sum is zero\n");
    }

    // Use a while loop to print elements
    int count = 0;
    ptr = array; // Assign array to pointer
    while (count < arraySize) {
        // Check if pointer is not null
        if (ptr != NULL) {
            printf("Element %d: %d\n", count, *(ptr + count));
        }
        count++;
    }

    return 0;
}