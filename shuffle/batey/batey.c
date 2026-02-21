#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>

void shuffle(int *arr, size_t n) {
  if (n <= 1)
    return;
  for (size_t i = 0; i < n; i++) {
    // Generate j in [i, n-1]
    size_t range = n - i;
    uint32_t r = (uint32_t)rand();
    size_t j = i + (size_t)(((uint64_t)r * (uint64_t)range) >> 31);

    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
