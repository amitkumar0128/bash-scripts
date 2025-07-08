#!/bin/bash

read -p "Enter your name: " name
if [ -z "$name" ]; then
    echo "No name provided. Exiting." >&2
    exit 1
fi

echo "Hello, $name! This is $(basename "$0")"
