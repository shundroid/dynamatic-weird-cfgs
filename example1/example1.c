#include "example1.h"
#include "dynamatic/Integration.h"
#include "stdlib.h"

void example1(in_int_t a[N], inout_int_t b[N]) {
  for (int i = 0; i < N; i++) {
    int temp = a[i];
    b[i] = temp;
    if (temp < 2) {
      break;
    }
  }
}

int main(void) {
  in_int_t a[N];
  inout_int_t b[N];

  srand(13);
  for (int j = 0; j < N; ++j) {
    a[j] = rand() % 10;
  }

  CALL_KERNEL(example1, a, b);
  return 0;
}
