#!/bin/bash

THRESHOLD=${1:-80}
TO_EMAIL=${2:-"example@example.com"}
SUBJECT="Disk Usage Alert on $(hostname)"

log() {
    echo "[$(date)] $1" >&2
}

check_disk_usage() {

disk_usage_percentage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
if [ $disk_usage_percentage -gt $THRESHOLD ]; then
    message="Warning: Disk usage exceeded $THRESHOLD% on $(hostname). Current usage: $disk_usage_percentage%."
    if ! echo "$message" | mail -s "$SUBJECT" "$TO_EMAIL"; then
        echo "ERROR: Failed to send alert email" >&2
        exit 1
    fi
    log "Alert sent for / ($disk_usage_percentage%)"
fi
}

check_disk_usage