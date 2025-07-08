#!/bin/bash

uptime=$(uptime -s)
echo "System up since: $uptime"

uptime=$(uptime -p | awk '{ print $2, $3 }')
echo "Total uptime: $uptime"