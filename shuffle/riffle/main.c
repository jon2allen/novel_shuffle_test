#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

void shuffle(int *arr, size_t n);

void print_array(const char *label, int *arr, size_t n) {
    printf("%s: [", label);
    for (size_t i = 0; i < n; i++) {
        printf("%d%s", arr[i], (i == n - 1) ? "" : ", ");
    }
    printf("]\n");
}

int main(int argc, char *argv[]) {
    size_t n = 500000;
    bool display = false;

    if (argc > 1) {
        int val = atoi(argv[1]);
        if (val >= 5 && val <= 25) {
            n = (size_t)val;
            display = true;
        } else {
            fprintf(stderr, "Usage: %s [size]\nsize must be between 5 and 25 for visual display, otherwise defaults to 500,000.\n", argv[0]);
        }
    }

    int *arr = malloc(n * sizeof(int));
    if (!arr) {
        perror("malloc");
        return 1;
    }

    for (size_t i = 0; i < n; i++) {
        arr[i] = (int)i;
    }

    if (display) {
        print_array("Before", arr, n);
    }

    srand((unsigned int)time(NULL));

    struct timespec start, end;
    if (clock_gettime(CLOCK_MONOTONIC, &start) == -1) {
        perror("clock_gettime");
        free(arr);
        return 1;
    }

    shuffle(arr, n);

    if (clock_gettime(CLOCK_MONOTONIC, &end) == -1) {
        perror("clock_gettime");
        free(arr);
        return 1;
    }

    double elapsed = (double)(end.tv_sec - start.tv_sec) * 1000.0 +
                     (double)(end.tv_nsec - start.tv_nsec) / 1000000.0;

    if (display) {
        print_array("After ", arr, n);
    }

    printf("Shuffled %zu elements in %.3f ms\n", n, elapsed);

    // Sanity check: sum of elements
    long long sum = 0;
    for (size_t i = 0; i < n; i++) {
        sum += (long long)arr[i];
    }
    long long expected_sum = (long long)n * (n - 1) / 2;
    
    if (sum != expected_sum) {
        fprintf(stderr, "Error: Sum mismatch! Evidence of data loss or duplication. Sum: %lld, Expected: %lld\n", sum, expected_sum);
        free(arr);
        return 1;
    } else if (!display) {
        printf("Sum verification passed: %lld\n", sum);
    }

    free(arr);
    return 0;
}
