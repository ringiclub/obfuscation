//
// Created by aldauge on 01/10/24.
//

#include <stdio.h>

/**
* This is a simple while loop that we
* will obfuscate manually using the
* variable transformations principle.
*/
void simple_loop_base() {
  int i =  1;
  while (i <= 100) {
    // some scripts ...
    printf("Base loop iteration: %d\n", i);
    i++;
  }
}

// We can obfuscate the loop counter *i*
// One possible way is to use a variable transformation.
//
// We define functions f and g to be :
//   f = λ i.(2i + 3)
//   g = λ i.(i − 3) div 2
// and we can verify that g · f = id.

// Using the rules of our principle (and nothing that the statement i++; corresponds to a use and assignement), we obtain:
void simple_loop_step1() {
  int j = 5;
  while ((j - 3) / 2 < 100) {
    // some scripts ...
    printf("Step 1 iteration: %d\n", (j - 3) / 2);
    j = (2 * (((j - 3) / 2) + 1)) + 3;
  }
}

// Another method we could use is to indicate a new variable, k, into the lopp and put an opaque predicate (depending on k) into the guard.
// The variable k performs no function in the loop, so we can make any assignement to k. As an example, our loop could be transformed to somethng of the form:
void simple_loop_step2() {
  int i = 1;
  int k = 20;
  while (i < 100 && (k * k * (k + 1) * (k + 1) % 4 == 0)) {
    // some scripts ...
    printf("Step 2 iteration: %d\n", i);
    i++;
    k *= (i + 3);
  }
}

// We could also put a false predicate into the middle of the loop that attempts to jumpt out of the loop.
// Our last example changes the original single loop into two loops:
void simple_loop_step3() {
  int j = 0;
  int k = 1;
  while(j < 10){
    while (k < 10) {
      // replaces uses of i by (10 * j) + k
      int i = (10 * j) + k; // Calculate i based on j and k
      printf("Step 3 iteration: j = %d, k = %d, i = %d\n", j, k, i);
      k++;
    }
     k = 0;
     j++;
  }
}

int main() {
  printf("Testing simple_loop_base:\n");
  simple_loop_base();

  printf("\nTesting simple_loop_step1:\n");
  simple_loop_step1();

  printf("\nTesting simple_loop_step2:\n");
  simple_loop_step2();

  printf("\nTesting simple_loop_step3:\n");
  simple_loop_step3();

  return 0;
}