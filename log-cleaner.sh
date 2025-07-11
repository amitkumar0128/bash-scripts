#!/bin/bash

clear_logs() {
    local days=${1:-7}
    local log_dir="/var/log/"

    echo "[$(date)] Starting log cleanup (older than $days days)..."

    local before_size=$(sudo du -h $log_dir | tail -n 1 | awk '{print $1}')
    echo "[$(date)] Size before clearing logs: $before_size"

    if ! sudo journalctl --vacuum-time="$days"days 2>/dev/null; then
        echo "ERROR: Failed to clear logs" >&2
        exit 1
    fi

    local after_size=$(sudo du -h $log_dir | tail -n 1 | awk '{print $1}')
    echo "[$(date)] Size after clearing logs: $after_size"
}

clear_logs "$@"
