//
// Created by aldauge on 01/10/24.
//

#include <stdio.h>
#include <time.h>

int main(void)
{
  struct timespec ts;
  clock_gettime(CLOCK_MONOTONIC, &ts);

  long long a = (ts.tv_sec * 1000LL) + (ts.tv_nsec / 1000000LL);
  long long b = a % 10;
  long long c = 0;

  for (long long i = 1; i <= b; i++) {
    c += a % 10;
  }

  return (int)c;
}