//
// Created by aldauge on 03/10/24.
//
void base() {
    // Opaque constants
    int a, b;

    if (7 * a * a - 1 != b * b) {
        // always true
    } else {
        // bogusCodes();
    }
}

void step1() {
    // Collatz conjecture
    int x; // for any x > 0

    while (x > 1) {
        if (x % 2 == 1) { // x is odd
            x *= 3+1;
        } else {
            x /= 2;
        }

        // always reachable
        if(x == 1) {
            // originalCodes();
        }
    }
}