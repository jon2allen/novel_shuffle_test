#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>

void shuffle(int *arr, size_t n) {
  if (n <= 1)
    return;

  int *state = malloc(n * sizeof(int));
  if (!state)
    return;

  // Linear initialization
  for (size_t i = 0; i < n; i++) {
    state[i] = (int)i;
  }

  size_t j = 0;
  // Fast range mapping constants
  uint64_t n64 = (uint64_t)n;

  for (size_t i = 0; i < n; i++) {
    // j = (j + state[i] + arr[i]) % n
    j = (j + (size_t)state[i] + (size_t)arr[i]);
    // Fast modulo using Lemire's idea if not power of 2
    // For simplicity here, since it's a running sum, we can't easily use the
    // multiplicative trick in the same way, but we can use simple conditional
    // subtraction if it's usually small, or just keep the modulo if it's not
    // the bottleneck. Actually, the bottleneck is often the random access.
    j %= n;

    int temp = state[i];
    state[i] = state[j];
    state[j] = temp;
  }

  for (size_t i = 0; i < n; i++) {
    // idx = arr[i] % n
    size_t idx = (size_t)arr[i];
    if (idx >= n)
      idx %= n;
    arr[i] = state[idx];
  }

  free(state);
}
