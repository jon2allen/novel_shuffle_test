#!/bin/bash
# Build all shuffle algorithm demonstrations

ALGS=("fisher_yates" "sattolo" "knuth" "rc4" "hindu" "riffle" "batey" "melissa" "pendulum" "tectonic")

for dir in "${ALGS[@]}"; do
    if [ -d "shuffle/$dir" ]; then
        echo "--- Building $dir ---"
        (cd "shuffle/$dir" && make clean && make)
    fi
done
