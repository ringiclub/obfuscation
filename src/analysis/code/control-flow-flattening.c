//
// Created by aldauge on 03/10/24.
//
#include <stdio.h>

void base() {
    int a = 1;
    int b = 2;

    while (a < 10) {
        b += a;
        if (b > 10) {
            b--;
        }
        a++;
    }

    printf("%d", b);
}

void step1() {
    int a = 1;
    int b = 2;

    L1:
        if (!(a < 10)) goto L3;
    b += a;

    if (b > 10) {
        b--;
    }

    a++;
    goto L1;

    L3:
        printf("%d\n", b);
}

void step2() {
    int swVar = 1;
    int a, b;

    switch (swVar) {
        case 1:
            a = 1; b = 2;  // Initialize a and b
        swVar = 2;     // Move to next case
        break;

        case 2:
            if (!(a < 10)) swVar = 6; // If a >= 10, go to case 6
            else swVar = 3;           // Else, go to case 3
        break;

        case 3:
            b += a;                  // Increment b
        if (!(b > 10)) swVar = 5; // If b <= 10, go to case 5
        else swVar = 4;          // Else, go to case 4
        break;

        case 4:
            b--;                     // Decrement b
        swVar = 5;              // Go to case 5
        break;

        case 5:
            a++;                    // Increment a
        swVar = 2;             // Go back to case 2
        break;

        case 6:
            printf("%d", b);        // Print the result
        break;
    }
}