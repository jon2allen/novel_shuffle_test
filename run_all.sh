#!/bin/bash
# Run all shuffle algorithm demonstrations (default 500k elements)

ALGS=("fisher_yates" "sattolo" "knuth" "rc4" "hindu" "riffle" "batey" "melissa" "pendulum" "tectonic")

for dir in "${ALGS[@]}"; do
    if [ -x "shuffle/$dir/shuffle_demo" ]; then
        echo "--- Executing $dir ---"
        (cd "shuffle/$dir" && ./shuffle_demo)
    else
        echo "Error: shuffle/$dir/shuffle_demo not found or not executable. Run ./build_all.sh first."
    fi
done
