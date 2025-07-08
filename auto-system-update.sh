#!/bin/bash

# Schedule using crontab for daily automation

if sudo apt-get update; then
    echo ""
    echo -e "\e[1;32mSystem upgraded succesfully.\e[0m"
    echo ""
else
    echo -e "\e[1;31mSystem update failed\e[0m" >&2
    exit 1
fi

if sudo apt-get upgrade -y; then
    echo ""
    echo -e "\e[1;32mSystem upgraded succesfully.\e[0m"
    echo ""
else
    echo -e "\e[1;31mSystem update failed\e[0m" >&2
    exit 1
fi
