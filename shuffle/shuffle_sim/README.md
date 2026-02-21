# Shuffle Simulator

A terminal-based visualizer for 8 different shuffling algorithms, written in Python using `curses`.

## Features
- Visualizes 24 items being shuffled.
- Highlights active elements involved in swaps or movements.
- Real-time movement log.
- Adjustable simulation speed.

## Controls
- **F1 - F8**: Select Shuffle Algorithm
    - F1: Fisher-Yates
    - F2: Sattolo's Algorithm
    - F3: Knuth Shuffle
    - F4: RC4 (Key Scheduling Algorithm)
    - F5: Hindu Shuffle
    - F6: Riffle Shuffle
    - F7: Batey Shuffle
    - F8: Melissa Shuffle (Partitioning)
- **Space**: Start/Pause Simulation
- **+ / -**: Increase/Decrease speed
- **r**: Reset Array
- **q**: Quit

## Execution
```bash
python3 shuffle_sim.py
```
