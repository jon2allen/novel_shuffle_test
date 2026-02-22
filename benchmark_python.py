import random
import time
import statistics

def fisher_yates(arr):
    n = len(arr)
    for i in range(n - 1, 0, -1):
        j = random.randint(0, i)
        arr[i], arr[j] = arr[j], arr[i]

def sattolo(arr):
    n = len(arr)
    for i in range(n - 1):
        j = random.randint(i + 1, n - 1)
        arr[i], arr[j] = arr[j], arr[i]

def knuth(arr):
    n = len(arr)
    for i in range(n - 1):
        j = random.randint(0, n - i - 1)
        arr[i], arr[i+j] = arr[i+j], arr[i]

def batey(arr):
    n = len(arr)
    for i in range(n):
        j = random.randint(i, n - 1)
        arr[i], arr[j] = arr[j], arr[i]

def rc4(arr):
    n = len(arr)
    state = list(range(n))
    j = 0
    for i in range(n):
        j = (j + state[i] + arr[i]) % n
        state[i], state[j] = state[j], state[i]
    for i in range(n):
        arr[i] = state[arr[i] % n]

def hindu(arr):
    n = len(arr)
    mid = n // 2
    left = arr[:mid]
    right = arr[mid:]
    
    res = []
    i, j = 0, 0
    while i < len(left) and j < len(right):
        if random.getrandbits(1):
            res.append(left[i])
            i += 1
        else:
            res.append(right[j])
            j += 1
    res.extend(left[i:])
    res.extend(right[j:])
    for k in range(n):
        arr[k] = res[k]

def riffle(arr):
    n = len(arr)
    mid = n // 2
    left = arr[:mid]
    right = arr[mid:]
    
    res = []
    i, j = 0, 0
    while i < len(left) and j < len(right):
        if random.getrandbits(1):
            res.append(left[i])
            i += 1
        else:
            res.append(right[j])
            j += 1
    res.extend(left[i:])
    res.extend(right[j:])
    for k in range(n):
        arr[k] = res[k]

def melissa_inplace(arr, start, n):
    if n <= 1:
        return
        
    pivot_idx = random.randint(start, start + n - 1)
    pivot_val = arr[pivot_idx]
    
    lt = start
    gt = start + n - 1
    i = start
    
    while i <= gt:
        if arr[i] < pivot_val:
            arr[i], arr[lt] = arr[lt], arr[i]
            i += 1
            lt += 1
        elif arr[i] > pivot_val:
            arr[i], arr[gt] = arr[gt], arr[i]
            if gt == 0:
                break
            gt -= 1
        else:
            i += 1
            
    if lt - start > 0:
        melissa_inplace(arr, start, lt - start)
    if gt < start + n - 1:
        melissa_inplace(arr, i, start + n - i)

def melissa(arr):
    melissa_inplace(arr, 0, len(arr))

def pendulum(arr):
    n = len(arr)
    left = 0
    right = n - 1
    turn = 0
    while left < right:
        window_size = right - left + 1
        j = random.randint(left, right)
        if turn % 2 == 0:
            arr[left], arr[j] = arr[j], arr[left]
            left += 1
        else:
            arr[right], arr[j] = arr[j], arr[right]
            right -= 1
        turn += 1

def tectonic(arr):
    n = len(arr)
    iterations = 3
    for _ in range(iterations):
        if n < 3:
            return
        
        fault = random.randint(1, n - 1)
        arr[0:fault] = arr[0:fault][::-1]
        arr[fault:n] = arr[fault:n][::-1]
        
        subduction_point = random.randint(1, n - 1)
        arr[0:subduction_point] = arr[0:subduction_point][::-1]
        arr[subduction_point:n] = arr[subduction_point:n][::-1]
        arr.reverse()

ALGORITHMS = {
    "batey": batey,
    "fisher_yates": fisher_yates,
    "hindu": hindu,
    "knuth": knuth,
    "melissa": melissa,
    "pendulum": pendulum,
    "rc4": rc4,
    "riffle": riffle,
    "sattolo": sattolo,
    "tectonic": tectonic
}

def main():
    import sys
    sys.setrecursionlimit(200000) # for melissa
    n_elements = 500000
    runs = 5
    
    print("Starting 5 benchmark runs...")
    
    results = {k: [] for k in ALGORITHMS.keys()}
    
    for run in range(runs):
        print(f"Run {run+1}/5...", end="", flush=True)
        for alg_name, alg_func in ALGORITHMS.items():
            arr = list(range(n_elements))
            
            start_time = time.time()
            alg_func(arr)
            end_time = time.time()
            
            elapsed_ms = (end_time - start_time) * 1000.0
            results[alg_name].append(elapsed_ms)
        print(" Done")
        
    print("\n" + "="*60)
    print(f"{'Algorithm':<20} | {'Mean (ms)':<12} | {'StdDev (ms)':<12} | {'Runs':<5}")
    print("-" * 60)
    
    for alg in sorted(results.keys()):
        times = results[alg]
        mean = statistics.mean(times)
        stdev = statistics.stdev(times)
        print(f"{alg:<20} | {mean:>12.3f} | {stdev:>12.3f} | {len(times):>5}")

    print("="*60)

if __name__ == "__main__":
    main()
