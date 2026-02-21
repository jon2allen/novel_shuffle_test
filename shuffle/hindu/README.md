# Hindu Shuffle

The Hindu shuffle (also known as the Indian shuffle) is a method of shuffling where packets of cards are taken from the top and dropped into the other hand.

### Bias
**Highly Biased**. This algorithm does not produce a uniform distribution of permutations. Many elements remain in sequential order within their packets.

### Algorithmic Complexity
- **Time**: O(n) (when implemented with pointers/temporary buffer)
- **Space**: O(n) (for temporary buffer)

### Potential Use
Commonly used in manual card shuffling. In software, it might be used to simulate human-like shuffling behavior rather than for statistical randomness.

### Timing Results (500,000 integers)
Timing: ~6.8 ms (500,000 integers)
