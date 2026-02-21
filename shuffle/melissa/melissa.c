#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

// Melissa shuffle optimized: Use in-place 3-way partitioning (Dutch National
// Flag algorithm) This eliminates the massive allocation overhead while keeping
// the recursive partitioning logic.
void melissa_shuffle_inplace(int *arr, size_t n) {
  if (n <= 1)
    return;

  // Fast range mapping for pivot selection
  uint32_t r = (uint32_t)rand();
  size_t pivot_idx = (size_t)(((uint64_t)r * (uint64_t)n) >> 31);
  int pivot_val = arr[pivot_idx];

  // In-place 3-way partition
  size_t lt = 0;
  size_t gt = n - 1;
  size_t i = 0;

  while (i <= gt) {
    if (arr[i] < pivot_val) {
      int temp = arr[i];
      arr[i] = arr[lt];
      arr[lt] = temp;
      i++;
      lt++;
    } else if (arr[i] > pivot_val) {
      int temp = arr[i];
      arr[i] = arr[gt];
      arr[gt] = temp;
      if (gt == 0)
        break; // Underflow protection
      gt--;
    } else {
      i++;
    }
  }

  // Recursively shuffle/sort left and right partitions
  // lt is the start of the middle section, gt is the end of it
  if (lt > 0) {
    melissa_shuffle_inplace(arr, lt);
  }
  if (gt < n - 1) {
    melissa_shuffle_inplace(arr + i, n - i);
  }
}

void shuffle(int *arr, size_t n) { melissa_shuffle_inplace(arr, n); }
