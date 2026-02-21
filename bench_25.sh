#!/bin/bash
# Run each shuffle algorithm 3 times with 25 items each

ALGS=("fisher_yates" "sattolo" "knuth" "rc4" "hindu" "riffle" "batey" "melissa" "pendulum" "tectonic")

for dir in "${ALGS[@]}"; do
    if [ -x "shuffle/$dir/shuffle_demo" ]; then
        echo "--- Benchmarking $dir (25 items, 3 runs) ---"
        for i in {1..3}; do
            echo "Run $i:"
            (cd "shuffle/$dir" && ./shuffle_demo 25)
            echo ""
        done
    else
        echo "Error: shuffle/$dir/shuffle_demo not found or not executable. Run ./build_all.sh first."
    fi
done
