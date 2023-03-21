#!/usr/bin/env bash

# --- helper functions for logs ---
info()
{
    echo '[INFO] ' "$@"
}
warn()
{
    echo '[WARN] ' "$@" >&2
}
fatal()
{
    echo '[ERROR] ' "$@" >&2
    exit 1
}

# --- use sudo if we are not already root ---
SUDO=sudo
if [ $(id -u) -eq 0 ]; then
    SUDO=
fi

# --- show logs if DEBUG is set ---
if [ -v DEBUG ]; then
    DEGUG=
else
    DEGUG=">/dev/null"
fi
