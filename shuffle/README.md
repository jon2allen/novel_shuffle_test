# Shuffle Algorithms Performance Comparison

This project implements and compares eight different shuffling algorithms in C. It includes performance measurement for large sequences and visual verification for small sequences.

## Algorithms Summary

| Algorithm | Folder | Type | Complexity | Bias |
| :--- | :--- | :--- | :--- | :--- |
| Fisher-Yates | fisher_yates/ | In-place | O(n) | Unbiased |
| Sattolo | sattolo/ | Cycle | O(n) | Unbiased (Derangement) |
| Knuth | knuth/ | In-place | O(n) | Unbiased |
| RC4 (KSA) | rc4/ | State-based | O(n) | Biased |
| Hindu | hindu/ | Packet | O(n) | Highly Biased |
| Riffle | riffle/ | Interleave | O(n) | Highly Biased |
| Batey | batey/ | Forward | O(n) | Unbiased |
| Melissa | melissa/ | Recursive | O(n log n) | Highly Biased (Sort-like) |

## Usage

The project includes several scripts to manage building and running the demonstrations.

### Build All
To compile all algorithm implementations:
```bash
./build_all.sh
```

### Performance Benchmarking
To run all algorithms with the default 500,000 items:
```bash
./run_all.sh
```

### Visual Verification
To run each algorithm 3 times with 25 items and see the before/after results:
```bash
./bench_25.sh
```

### Individual Execution
Each directory contains a standalone Makefile and executable. You can specify a custom size (5-25) for visual mode:
```bash
cd fisher_yates
make
./shuffle_demo 15
```

## Requirements
- GCC
- Make
- POSIX-compliant environment (for clock_gettime)
