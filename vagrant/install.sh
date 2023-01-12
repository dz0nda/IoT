#! /bin/sh

echo "\033[0;32m╔═══════════════════════╗\033[0m"
echo "\033[0;32m║ Installing Vagrant... ║\033[0m"
echo "\033[0;32m╚═══════════════════════╝\033[0m"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    brew install vagrant
else
    # Linux (Ubuntu/Debian)
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
    sudo apt update && sudo apt install vagrant
fi

if [ $? -ne 0 ]; then
    echo "\033[0;32m╔══════════════════════════════╗\033[0m"
    echo "\033[0;32m║ Vagrant installation failed  ║\033[0m"
    echo "\033[0;32m╚══════════════════════════════╝\033[0m"
else
    echo "\033[0;32m╔══════════════════════════════╗\033[0m"
    echo "\033[0;32m║ Vagrant installation succeed ║\033[0m"
    echo "\033[0;32m╚══════════════════════════════╝\033[0m"
fi
