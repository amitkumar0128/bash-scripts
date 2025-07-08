#!/bin/bash

boot_time=$(uptime -s) || { echo -e "\e[1;31mError: Failed to get boot time\e[0m" >&2; exit 1; }
echo "System up since: $boot_time"

uptime_duration=$(uptime -p | cut -d ' ' -f 2-) || { echo -e "\e[1;31mError: Failed to get boot time\e[0m" >&2; exit 1; }
echo "Total uptime: $uptime_duration"
