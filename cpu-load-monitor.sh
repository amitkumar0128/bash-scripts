#!/bin/bash
set -euo pipefail

declare -A COMMANDS
COMMANDS["CPU Usage"]="grep 'cpu ' /proc/stat | awk '{usage=100-(\$5*100)/(\$2+\$3+\$4+\$5+\$6+\$7+\$8+\$9+\$10)} END {print usage\"%\"}'"
COMMANDS["Load Average"]="cat /proc/loadavg | awk '{print \$1,\$2,\$3}'"
COMMANDS["Clock Speed"]="awk '/MHz/ {print \$4/1000 \" GHz\"}' /proc/cpuinfo | head -n 1"
COMMANDS["Context Switches"]="vmstat 1 2 | awk 'END {print \$12 \" cs/s\"}'"
COMMANDS["Core Usage"]="mpstat -P ALL 1 1 | awk '/^[0-9]/ {print \"Core \"\$2\": \"\$3\"%\"}' | grep -v CPU"
COMMANDS["Thread Count"]="ps -eLf 2>/dev/null | wc -l | awk '{print \$1-1 \" threads\"}'"

for label in "${!COMMANDS[@]}"; do
    echo -n "[$label] "
    if ! eval "${COMMANDS[$label]}"; then
        echo "ERROR: Failed to get $label" >&2
        exit 1
    fi
done