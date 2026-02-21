# Melissa Shuffle

The Melissa shuffle, as described in the reference, uses a recursive partitioning strategy similar to Quicksort.

### Bias
**Highly Biased (Sorts instead of Shuffles)**. If the partitioning is based on values (as in the provided logic), this algorithm effectively performs a randomized Quicksort, resulting in a sorted array rather than a random permutation. It is included here as per the project requirements.

### Algorithmic Complexity
- **Time**: Average O(n log n), Worst O(n^2)
- **Space**: O(n log n) or O(n) depending on implementation (this implementation uses O(n) per level).

### Potential Use
Primarily of academic interest as a demonstration of recursive partitioning. Paradoxically, it results in a sorted sequence rather than a shuffled one if implemented with value-based comparisons.

### Timing Results (500,000 integers)
Timing: ~37.5 ms (500,000 integers)
