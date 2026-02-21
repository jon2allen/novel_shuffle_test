#include <stddef.h>
#include <stdlib.h>
#include <string.h>

void shuffle(int *arr, size_t n) {
  if (n <= 1)
    return;

  int *temp = malloc(n * sizeof(int));
  if (!temp)
    return;

  size_t mid = n / 2;
  size_t left_idx = 0;
  size_t right_idx = mid;
  size_t result_idx = 0;

  int random_bits = 0;
  int bits_left = 0;

  // Riffle shuffle: interleave two halves
  while (left_idx < mid && right_idx < n) {
    if (bits_left == 0) {
      random_bits = rand();
      bits_left = 31;
    }

    if (random_bits & 1) {
      temp[result_idx++] = arr[left_idx++];
    } else {
      temp[result_idx++] = arr[right_idx++];
    }
    random_bits >>= 1;
    bits_left--;
  }

  // Append remaining elements
  if (left_idx < mid) {
    memcpy(&temp[result_idx], &arr[left_idx], (mid - left_idx) * sizeof(int));
  } else if (right_idx < n) {
    memcpy(&temp[result_idx], &arr[right_idx], (n - right_idx) * sizeof(int));
  }

  memcpy(arr, temp, n * sizeof(int));
  free(temp);
}
