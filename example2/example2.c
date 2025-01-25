#include "example2.h"
#include "dynamatic/Integration.h"
#include "stdlib.h"

int example2(in_int_t a[N]) {
  int i = 0;
  int sum = 0;
  do {
    sum += a[i];
    i++;
  } while (sum < 100);
  return sum;
}

int main(void) {
  in_int_t a[N];

  srand(13);
  for (int j = 0; j < N; ++j) {
    a[j] = rand() % 10;
  }

  CALL_KERNEL(example2, a);
  return 0;
}
