# System Resource Monitor

A simple Bash script for monitoring your system's CPU, memory, and disk usage in real-time with a colorful progress bar display.

## Features

- **Real-time monitoring** of CPU, RAM, and disk usage.
- **Color-coded output**: 
  - Green for low usage (<50%)
  - Yellow for moderate usage (50–79%)
  - Red for high usage (≥80%)
- **Progress bars** for each resource.
- **Terminal-friendly** display, refreshes every 2 seconds.

## Requirements

- Bash
- Standard Linux utilities: `top`, `free`, `df`, `awk`, `sed`, `grep`

## Usage

1. **Download the script:**
   ```bash
   wget https://github.com/varun149/System-Resource-Monitor/raw/main/system_res_mon.sh
   ```

2. **Make it executable:**
   ```bash
   chmod +x system_res_mon.sh
   ```

3. **Run the script:**
   ```bash
   ./system_res_mon.sh
   ```

   The script will clear your terminal and display system resource usage. Press `Ctrl+C` to exit.

## How It Works

- **CPU Usage:** Uses `top` to get current CPU idle percentage, then calculates usage.
- **Memory Usage:** Uses `free` to show percent of RAM used.
- **Disk Usage:** Uses `df` for root (`/`) partition usage.
- Each resource is shown with a progress bar and color based on utilization.

## Example Output

```
=== SYSTEM RESOURCE MONITOR ===

CPU Usage:    [##########------------------------------------] 20%
Memory Usage: [#############################-----------------] 55%
Disk Usage:   [##################----------------------------] 34%

Press Ctrl+C to exit
```

## Customization

- Change the refresh rate by editing the `sleep 2` line at the end of the script.
- Modify resource thresholds or add additional resource checks as needed.

## Note
This project is mainly for learning/demo purposes. Feel free to explore or use the code, but no official license is provided.

