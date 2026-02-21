# Sattolo's Algorithm

Sattolo's algorithm is a variation of the Fisher-Yates shuffle that produces a random cyclic permutation (a derangement) of the sequence.

### Bias
**Unbiased** (within the space of cyclic permutations). However, it is biased if a general random permutation is expected, as an element is never swapped with itself.

### Algorithmic Complexity
- **Time**: O(n)
- **Space**: O(1) (in-place)

### Potential Use
Useful when generating derangements (where no element remains in its original position) or for creating a single large cycle.

### Timing Results (500,000 integers)
Timing: ~7.4 ms (500,000 integers)
