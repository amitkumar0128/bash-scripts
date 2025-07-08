#!/bin/bash

read -p "Enter your name: " name
if [ -z "$name" ]; then
    echo "No name provided. Exiting."
    exit 1
fi

echo "Hello, $name! This is hello-user-script.sh"
