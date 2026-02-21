# RC4 Shuffle

The RC4 shuffle is based on the Key Scheduling Algorithm (KSA) of the RC4 stream cipher. It uses the input array as a "key" to shuffle a state array, which is then used to transform the input array.

### Bias
**Biased**. RC4's KSA is known to have some statistical biases (e.g., the "second-byte" bias). As a general shuffling algorithm, it is much less "random" than Fisher-Yates.

### Algorithmic Complexity
- **Time**: O(n)
- **Space**: O(n) (requires an additional state array)

### Potential Use
Primarily used in cryptography as part of state initialization. Not recommended for general-purpose shuffling where unbiased results are required.

### Timing Results (500,000 integers)
Timing: ~7.2 ms (500,000 integers)
