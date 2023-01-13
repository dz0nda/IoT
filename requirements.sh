#! /bin/sh

OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)

# VirtualBox
if ! [ -x "$(command -v vboxmanage)" ];
then
    echo " Installing Virtualbox..."
    if [ "$OS" = "\"Ubuntu\"" ];
    then
        echo " Installing on Ubuntu..."
        sudo apt-get install virtualbox
        sudo apt-get install virtualbox—ext-pack
    fi

    echo "\033[0;32m Virtualbox installed. \033[0m"
else
    echo "\033[0;32m VirtualBox already installed. \033[0m";
fi

# Vagrant
if ! [ -x "$(command -v vagrant)" ];
then
    echo " Installing Vagrant..."
    if [ "$OS" = "\"Ubuntu\"" ];
    then
        echo " Installing on Ubuntu..."
        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update
        sudo apt install vagrant
    fi

    echo "\033[0;32m Vagrant installed. \033[0m"
else
    echo "\033[0;32m Vagrant already installed. \033[0m";
fi
