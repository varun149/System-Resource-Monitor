#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# CPU Usage
get_cpu_usage() {
  top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'
}

# Memory Usage
get_memory_usage() {
  free | grep Mem | awk '{print int($3/$2 * 100)}'
}

# Disk Usage
get_disk_usage() {
  df / | grep / | awk '{print $5}' | sed 's/%//'
} 

progress_bar() {
  local percent=$1
  local size=50
  local completed=$((percent * size / 100))
  local remaining=$((size - completed))
  local bar="["
  
  for ((i=0; i<completed; i++)); do
    bar+="#"
  done
  
  for ((i=0; i<remaining; i++)); do
    bar+="-"
  done
  
  bar+="] $percent%"
  echo "$bar"
}

get_color() {
  local usage=$1
  
  if [ "$usage" -lt 50 ]; then
    echo "$GREEN"
  elif [ "$usage" -lt 80 ]; then
    echo "$YELLOW"
  else
    echo "$RED"
  fi
}

main() {
  clear
  echo -e "${BLUE}=== SYSTEM RESOURCE MONITOR ===${NC}"
  echo
  
  # CPU Usage
  local cpu_numeric=$(get_cpu_usage | cut -d. -f1)
  local cpu_color=$(get_color $cpu_numeric)
  echo -e "${BLUE}CPU Usage:${NC} ${cpu_color}$(progress_bar $cpu_numeric)${NC}"
  
  # Memory Usage
  local mem_numeric=$(get_memory_usage)
  local mem_color=$(get_color $mem_numeric)
  echo -e "${BLUE}Memory Usage:${NC} ${mem_color}$(progress_bar $mem_numeric)${NC}"
 
  # Disk Usage
  local disk_numeric=$(get_disk_usage)
  local disk_color=$(get_color $disk_numeric)
  echo -e "${BLUE}Disk Usage:${NC} ${disk_color}$(progress_bar $disk_numeric)${NC}"
  
  echo
  echo -e "${BLUE}Press Ctrl+C to exit${NC}"
}

while true; do
  main
  sleep 2
done

