#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>

void shuffle(int *arr, size_t n) {
  if (n <= 1)
    return;

  // Using Lemire's fast range mapping to avoid expensive modulo (%)
  // j = ((uint64_t)rand() * (uint64_t)range) >> 32
  for (size_t i = n - 1; i > 0; i--) {
    uint32_t r = (uint32_t)rand();
    size_t j = (size_t)(((uint64_t)r * (uint64_t)(i + 1)) >>
                        31); // rand() is usually 31 bits in many libcs

    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
