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

# --- fetch the OS system ---
info "OS: $OSTYPE"

# --- fetch the OS system ---

# VirtualBox
if ! [ -x "$(command -v vboxmanage)" ]; then
    info "Installing Virtualbox..."

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
        if [ "$OS" = "\"Ubuntu\"" ]; then
            info "Installing on Ubuntu..."

            $SUDO apt-get install virtualbox
            $SUDO apt-get install virtualbox—ext-pack
        else
            fatal "Linux OS not supported."
        fi
    elif  [[ "$OSTYPE" == "darwin"* ]]; then
        info "Installing on Mac..."

        brew install virtualbox --cask
    else
        fatal "OS not supported."
    fi

    info "Virtualbox installed."
else
    info "VirtualBox already installed.";
fi

# Vagrant
if ! [ -x "$(command -v vagrant)" ];
then
    info "Installing Vagrant..."

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
        if [ "$OS" = "\"Ubuntu\"" ]; then
            info "Installing on Ubuntu..."

            wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
            echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
            $SUDO apt update
            $SUDO apt install vagrant
        else
            fatal "Linux OS not supported."
        fi
    elif  [[ "$OSTYPE" == "darwin"* ]]; then
        info "Installing on Mac..."

        brew install vagrant --cask
    else
        fatal "OS not supported."
    fi

    info "Vagrant installed."
else
    info "Vagrant already installed.";
fi
