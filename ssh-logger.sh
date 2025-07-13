#!/bin/bash

set -euo pipefail  # Fail on errors/unset vars

OS=$(grep -i '^ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"' | tr '[:upper:]' '[:lower:]')
PACKAGE="auditd"
PKM="apt"
SSHD_PATH=$(which sshd || echo "/usr/sbin/sshd")


install_audit() {
    if [[ $OS == "rhel" || $OS == "centos" ]]; then
        PACKAGE="audit"
        PKM="yum"
    fi

    if ! which $PACKAGE >/dev/null; then
        if ! sudo $PKM install $PACKAGE -y; then
            echo "ERROR: Failed to Install $PACKAGE" >&2
            exit 1
        fi
        echo "Successfully installed $PACKAGE"
    else
        echo "$PACKAGE is already present"
    fi
}

add_rule() {
    echo "-w $SSHD_PATH -p x -k sshd_logins" | sudo tee -a /etc/audit/rules.d/sshd.rules >/dev/null
    echo "Step: 2"
}

main() {
    if ! command -v sudo >/dev/null; then
        echo "ERROR: sudo is required" >&2
        exit 1
    fi

    install_audit
    add_rule
    echo "Step: 3"
    # sudo augenrules --load
    echo "Step: 4"
    sudo systemctl restart $PACKAGE
    echo "step 5"
    if ! sudo auditctl -l | grep -q "sshd_logins"; then
        echo "ERROR: Rule not loaded" >&2
        exit 1
    fi
    echo "Step: 4"
}

main
