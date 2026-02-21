#include <stdlib.h>

void pendulum_shuffle(int *arr, int n) {
    int left = 0;
    int right = n - 1;
    int turn = 0;
    
    while (left < right) {
        int window_size = right - left + 1;
        int j = left + (rand() % window_size);
        
        if (turn % 2 == 0) {
            int temp = arr[left];
            arr[left] = arr[j];
            arr[j] = temp;
            left++;
        } else {
            int temp = arr[right];
            arr[right] = arr[j];
            arr[j] = temp;
            right--;
        }
        turn++;
    }
}

void shuffle(int *arr, size_t n) {
    pendulum_shuffle(arr, (int)n);
}
