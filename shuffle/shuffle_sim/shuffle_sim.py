#############################
# Created by Antigravity
# January 2026
# Shuffle Simulator
#############################
import curses
import random
import time
import logging

# Setup logging configuration
logging.basicConfig(
    filename='shuffle_sim.log',
    level=logging.INFO,
    format='%(asctime)s | %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

def draw_box(win, y, x, height, width, title):
    win.attron(curses.color_pair(3))
    for i in range(width):
        win.addch(y, x + i, curses.ACS_HLINE)
        win.addch(y + height, x + i, curses.ACS_HLINE)
    for i in range(height):
        win.addch(y + i, x, curses.ACS_VLINE)
        win.addch(y + i, x + width, curses.ACS_VLINE)
    win.addch(y, x, curses.ACS_ULCORNER)
    win.addch(y, x + width, curses.ACS_URCORNER)
    win.addch(y + height, x, curses.ACS_LLCORNER)
    try:
        win.move(y + height, x + width)
        win.insch(curses.ACS_LRCORNER)
    except:
        pass
    win.addstr(y, x + 2, f" {title} ")
    win.attroff(curses.color_pair(3))

# --- Shuffle Implementation Generators ---

def fisher_yates(arr):
    n = len(arr)
    for i in range(n - 1, 0, -1):
        j = random.randint(0, i)
        yield (i, j, f"Swap indices {i} and {j}")
        arr[i], arr[j] = arr[j], arr[i]

def sattolo(arr):
    n = len(arr)
    for i in range(n - 1, 0, -1):
        j = random.randint(0, i - 1)
        yield (i, j, f"Swap indices {i} and {j} (Excludes self)")
        arr[i], arr[j] = arr[j], arr[i]

def knuth(arr):
    n = len(arr)
    for i in range(n - 1):
        j = random.randint(0, n - i - 1)
        yield (i, i + j, f"Swap indices {i} and {i+j}")
        arr[i], arr[i + j] = arr[i + j], arr[i]

def rc4(arr):
    # RC4 needs a 'key', we'll use random values or the array itself
    n = len(arr)
    state = list(range(n))
    j = 0
    for i in range(n):
        # Using arr[i] as the "key" material for KSA
        j = (j + state[i] + arr[i]) % n
        yield (i, j, f"KSA Swap: indices {i} and {j}")
        state[i], state[j] = state[j], state[i]
    # Update arr with state
    for i in range(n):
        yield (i, i, f"Map through state: index {i}")
        arr[i] = state[i]

def hindu(arr):
    # Simple packet-based interleaving simulation
    n = len(arr)
    mid = n // 2
    temp = []
    l_idx, r_idx = 0, mid
    while l_idx < mid or r_idx < n:
        if l_idx < mid and (r_idx == n or random.random() < 0.5):
            val = arr[l_idx]
            yield (l_idx, -1, f"Take from left half: {val}")
            temp.append(val)
            l_idx += 1
        else:
            val = arr[r_idx]
            yield (r_idx, -1, f"Take from right half: {val}")
            temp.append(val)
            r_idx += 1
    for i in range(n):
        arr[i] = temp[i]
    yield (-1, -1, "Hindu Shuffle Complete")

def riffle(arr):
    n = len(arr)
    mid = n // 2
    temp = []
    l_idx, r_idx = 0, mid
    while l_idx < mid or r_idx < n:
        # Alternating with some randomness
        if l_idx < mid and (r_idx == n or random.random() < 0.5):
            val = arr[l_idx]
            yield (l_idx, -1, f"Riffle from top half: {val}")
            temp.append(val)
            l_idx += 1
        elif r_idx < n:
            val = arr[r_idx]
            yield (r_idx, -1, f"Riffle from bottom half: {val}")
            temp.append(val)
            r_idx += 1
    for i in range(n):
        arr[i] = temp[i]
    yield (-1, -1, "Riffle Shuffle Complete")

def batey(arr):
    n = len(arr)
    for i in range(n):
        j = i + (random.randint(0, 2**32-1) % (n - i))
        yield (i, j, f"Batey Swap: indices {i} and {j}")
        arr[i], arr[j] = arr[j], arr[i]

def melissa(arr):
    # Non-recursive implementation for easier generator state
    # We'll simulate the partitioning steps
    def part(start, end):
        if end - start <= 1: return
        p_idx = random.randint(start, end - 1)
        pivot = arr[p_idx]
        yield (p_idx, -1, f"Pivot selected: {pivot}")
        
        # Simple partition simulation
        left, middle, right = [], [], []
        for i in range(start, end):
            if arr[i] < pivot: left.append(arr[i])
            elif arr[i] == pivot: middle.append(arr[i])
            else: right.append(arr[i])
            yield (i, -1, f"Partitioning element {arr[i]}")
        
        res = left + middle + right
        for i in range(len(res)):
            arr[start + i] = res[i]
        
        yield from part(start, start + len(left))
        yield from part(start + len(left) + len(middle), end)

    yield from part(0, len(arr))

def main(stdscr):
    curses.curs_set(0)
    stdscr.nodelay(True)
    curses.start_color()
    curses.init_pair(1, curses.COLOR_GREEN, curses.COLOR_BLACK)  
    curses.init_pair(2, curses.COLOR_RED, curses.COLOR_BLACK)    
    curses.init_pair(3, curses.COLOR_CYAN, curses.COLOR_BLACK)   
    curses.init_pair(4, curses.COLOR_YELLOW, curses.COLOR_BLACK) 
    curses.init_pair(5, curses.COLOR_MAGENTA, curses.COLOR_BLACK)

    # State
    SIZE = 24
    array = list(range(SIZE))
    history = []
    sim_speed = 0.2
    paused = True
    
    current_alg_name = "Fisher-Yates"
    current_generator = fisher_yates(array)
    
    algs = {
        curses.KEY_F1: ("Fisher-Yates", fisher_yates),
        curses.KEY_F2: ("Sattolo", sattolo),
        curses.KEY_F3: ("Knuth", knuth),
        curses.KEY_F4: ("RC4 KSA", rc4),
        curses.KEY_F5: ("Hindu", hindu),
        curses.KEY_F6: ("Riffle", riffle),
        curses.KEY_F7: ("Batey", batey),
        curses.KEY_F8: ("Melissa", melissa),
    }

    active_indices = (-1, -1)
    last_msg = "Ready to start"

    while True:
        key = stdscr.getch()

        if key == ord('q'): break
        elif key == ord(' '): paused = not paused
        elif key == ord('+'): sim_speed = max(0.01, sim_speed - 0.05)
        elif key == ord('-'): sim_speed = min(1.0, sim_speed + 0.05)
        elif key == ord('r'):
            array = list(range(SIZE))
            current_generator = None
            paused = True
            active_indices = (-1, -1)
            last_msg = "Reset"
            history = []
        elif key in algs:
            name, func = algs[key]
            current_alg_name = name
            array = list(range(SIZE)) # Reset for new shuffle
            current_generator = func(array)
            paused = True
            active_indices = (-1, -1)
            last_msg = f"Switched to {name}"
            history = []

        if not paused and current_generator:
            try:
                state = next(current_generator)
                active_indices = (state[0], state[1])
                last_msg = state[2]
                history.append(last_msg)
            except StopIteration:
                current_generator = None
                paused = True
                active_indices = (-1, -1)
                last_msg = "Shuffle Complete"
                history.append(last_msg)
        
        # Only redraw if a key was pressed, the simulation is running, or it's the first loop
        should_redraw = (key != -1) or (not paused and current_generator) or (history == [])

        if should_redraw:
            # --- DRAWING ---
            stdscr.erase()
            sh, sw = stdscr.getmaxyx()
            
            draw_box(stdscr, 1, 2, 4, sw - 5, "SHUFFLE ARRAY (24 ITEMS)")
            # Draw array items
            for i in range(SIZE):
                color = curses.A_NORMAL
                if i == active_indices[0] or i == active_indices[1]:
                    color = curses.color_pair(2) | curses.A_BOLD
                
                x_pos = 4 + (i * 4)
                if x_pos < sw - 10:
                    stdscr.addstr(2, x_pos, f"{array[i]:02}", color)
                    stdscr.addstr(3, x_pos, f" ^ ", color if i in active_indices else curses.A_DIM)

            draw_box(stdscr, 6, 2, 10, 40, "CONTROLS & STATUS")
            stdscr.addstr(8, 4, f"Algorithm: {current_alg_name}", curses.color_pair(3) | curses.A_BOLD)
            stdscr.addstr(10, 4, f"Status: {'PAUSED' if paused else 'RUNNING'}")
            stdscr.addstr(12, 4, f"Step: {last_msg[:34]}")
            stdscr.addstr(14, 4, f"Speed: {sim_speed:.2f}s delay")

            draw_box(stdscr, 6, 44, 10, sw - 47, "ALGORITHM MOVEMENT LOG")
            for idx, entry in enumerate(history[-8:]):
                stdscr.addstr(7+idx, 46, f"> {entry[:sw-50]}")

            # Help footer
            stdscr.addstr(18, 2, "F1:FY F2:Sattolo F3:Knuth F4:RC4 F5:Hindu F6:Riffle F7:Batey F8:Melissa")
            stdscr.addstr(19, 2, "[Space] Start/Stop [+] Faster [-] Slower [r] Reset [q] Quit")

            # Art
            art = [
                "  ____  _   _ _   _ _____ _____ _     _____ ",
                " / ___|| | | | | | |  ___|  ___| |   | ____|",
                " \\___ \\| |_| | | | | |_  | |_  | |   |  _|  ",
                "  ___) |  _  | |_| |  _| |  _| | |___| |___ ",
                " |____/|_| |_|\\___/|_|   |_|   |_____|_____|"
            ]
            for i, line in enumerate(art):
                if 22 + i < sh:
                    stdscr.addstr(22 + i, 2, line, curses.color_pair(4) | curses.A_BOLD)

            stdscr.refresh()
        
        if not paused and current_generator:
            time.sleep(sim_speed)
        else:
            time.sleep(0.05)

if __name__ == "__main__":
    curses.wrapper(main)
