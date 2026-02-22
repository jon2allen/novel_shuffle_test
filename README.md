# Novel Shuffles Benchmark

This repository demonstrates the integration and benchmarking of two novel shuffle algorithms—**Pendulum** and **Tectonic**—alongside standard shuffle variants like Fisher-Yates, Sattolo, and Knuth.

## The New Variants

### Pendulum Shuffle
The Pendulum Shuffle operates by progressively collapsing an unshuffled window from the outside in. In each step, it selects a random element from the remaining window and swaps it to either the left or right boundary, alternating directions much like a swinging pendulum. 

### Tectonic Shuffle
The Tectonic Shuffle simulates the destructive shockwaves of an earthquake. Instead of shuffling element-by-element, it applies structural transmutations to the array in iterations (typically 3):
1. **Fault Line:** It picks a random pivot point (fault line).
2. **Shockwave:** It reverses the segments on both sides of the fault.
3. **Subduction:** It rotates the entire array around a random subduction point.

The process is extremely fast due to utilizing macro array-reverse operations rather than relying exclusively on element-by-element loop selection.

### Why Array Reversals Are Fast (GCC Vectorization)
You might assume that performing large array reverse operations multiple times would be slow. However, array reversals iterate continuously over adjacent memory locations. This predictable, contiguous memory access pattern allows modern compilers like `gcc` (with `-O2` or `-O3`) to heavily optimize and auto-vectorize the loop using SIMD (Single Instruction, Multiple Data) extensions (such as AVX or SSE). Instead of reading and swapping one integer at a time, the CPU can load, permute, and store entire vectors of integers at once. In contrast, traditional algorithms like Fisher-Yates rely on random indexing. This leads to unpredictable memory access patterns, defeating auto-vectorization, inducing CPU pipeline stalls due to branch misprediction, and causing frequent L1 cache misses. As a result, Tectonic's macro-operations are computationally much cheaper per element than scalar, random element-by-element selection.

## Performance Metrics

We benchmarked these algorithms shuffling 500,000 items (average of 5 runs). We compiled the algorithms using both standard `gcc` (with `-O2`) and the Claude C Compiler (`ccc`), to observe how different compilers optimize the new macro-operations versus typical loop mutations.

### 1. `gcc` Compilation `-O2`
| Algorithm            | Mean (ms)    | StdDev (ms)  | Runs |
|----------------------|-------------:|-------------:|-----:|
| **tectonic**         |    **1.241** |        0.024 |    5 |
| hindu                |        2.153 |        0.041 |    5 |
| riffle               |        2.354 |        0.032 |    5 |
| rc4                  |        4.991 |        0.085 |    5 |
| batey                |        6.346 |        0.059 |    5 |
| knuth                |        6.350 |        0.078 |    5 |
| sattolo              |        6.490 |        0.201 |    5 |
| **pendulum**         |    **6.972** |        0.067 |    5 |
| fisher_yates         |        7.451 |        2.659 |    5 |
| melissa              |       24.215 |        0.137 |    5 |

*Tectonic is incredibly fast under standard `gcc` optimization, outperforming the rest of the algorithms. Pendulum performs similarly to standard Fisher-Yates and Sattolo, placing comfortably in the middle of the pack.*

### 2. `ccc` (Claude C Compiler) Optimization
| Algorithm            | Mean (ms)    | StdDev (ms)  | Runs |
|----------------------|-------------:|-------------:|-----:|
| hindu                |        4.372 |        0.040 |    5 |
| riffle               |        4.384 |        0.023 |    5 |
| **tectonic**         |    **4.981** |        0.007 |    5 |
| fisher_yates         |        6.946 |        0.025 |    5 |
| knuth                |        6.955 |        0.050 |    5 |
| batey                |        7.139 |        0.152 |    5 |
| rc4                  |        7.238 |        0.166 |    5 |
| sattolo              |        7.269 |        0.166 |    5 |
| **pendulum**         |   **10.890** |        0.148 |    5 |
| melissa              |       47.585 |        0.094 |    5 |

*When compiled with `ccc`, `tectonic` remains competitive (ranked 3rd) but loses some of the aggressive inlining/vectorization benefits it sees with `gcc` for the reverse operations. `pendulum` suffers a slight penalty compared to other shuffles possibly due to the branching inside the main while-loop.*

### 3. Python Implementation (CPython)
| Algorithm            | Mean (ms)    | StdDev (ms)  | Runs |
|----------------------|-------------:|-------------:|-----:|
| **tectonic**         |     **55.6** |          8.2 |    5 |
| hindu                |       88.6   |          5.6 |    5 |
| riffle               |       90.3   |          6.9 |    5 |
| rc4                  |      187.8   |         10.7 |    5 |
| fisher_yates         |      262.8   |          5.9 |    5 |
| batey                |      276.6   |          6.6 |    5 |
| sattolo              |      288.9   |          5.8 |    5 |
| knuth                |      293.3   |          7.9 |    5 |
| **pendulum**         |    **313.3** |         10.5 |    5 |
| melissa              |     1172.7   |         22.8 |    5 |

*In native Python, Tectonic overwhelmingly outperforms standard single-element swaps because its slice reversions offload the operations into fast low-level C-bindings. Standard algorithms like Fisher-Yates force an expensive Python interpreter loop for each random integer generation and list swap over 500k iterations.*

## Summary
The **Tectonic** algorithm proves to be an exceedingly fast permutation generator, especially with traditional vectorizing compilers like GCC. **Pendulum** introduces an interesting alternating boundary approach, providing Fisher-Yates level timings under typical compilation environments.
