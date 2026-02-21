# Knuth Shuffle

The Knuth shuffle is an alternative implementation/name for the Fisher-Yates algorithm, popularized by Donald Knuth in "The Art of Computer Programming".

### Bias
**Unbiased**. It covers all n! permutations with equal probability.

### Algorithmic Complexity
- **Time**: O(n)
- **Space**: O(1)

### Potential Use
Same as Fisher-Yates; standard algorithm for producing fair random permutations.

### Timing Results (500,000 integers)
Timing: ~7.3 ms (500,000 integers)
