import subprocess
import re
import statistics
import collections

def run_benchmark():
    try:
        result = subprocess.run(['./run_all.sh'], capture_output=True, text=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error running benchmark: {e}")
        return None

def parse_output(output):
    # Matches "--- Executing algorithm ---" and "Shuffled 500000 elements in X.XXX ms"
    alg_data = collections.defaultdict(list)
    current_alg = None
    
    for line in output.splitlines():
        if line.startswith("--- Executing"):
            current_alg = line.split()[2]
        elif "Shuffled" in line and "elements in" in line:
            match = re.search(r"in ([\d.]+) ms", line)
            if match and current_alg:
                alg_data[current_alg].append(float(match.group(1)))
    
    return alg_data

def main():
    all_runs = []
    print("Starting 5 benchmark runs...")
    for i in range(5):
        print(f"Run {i+1}/5...", end="", flush=True)
        output = run_benchmark()
        if output:
            all_runs.append(parse_output(output))
            print(" Done")
        else:
            print(" Failed")

    if not all_runs:
        print("No data collected.")
        return

    # Combine data
    combined = collections.defaultdict(list)
    for run in all_runs:
        for alg, times in run.items():
            combined[alg].extend(times)

    print("\n" + "="*60)
    print(f"{'Algorithm':<20} | {'Mean (ms)':<12} | {'StdDev (ms)':<12} | {'Runs':<5}")
    print("-" * 60)
    
    for alg in sorted(combined.keys()):
        times = combined[alg]
        if len(times) > 1:
            mean = statistics.mean(times)
            stdev = statistics.stdev(times)
            print(f"{alg:<20} | {mean:>12.3f} | {stdev:>12.3f} | {len(times):>5}")
        elif len(times) == 1:
            print(f"{alg:<20} | {times[0]:>12.3f} | {'N/A':>12} | {len(times):>5}")

    print("="*60)

if __name__ == "__main__":
    main()
