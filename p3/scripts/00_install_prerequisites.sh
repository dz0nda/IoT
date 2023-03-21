#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/../../utils/helper.sh

# # --- verify existence of commands executable ---
# check_command() {
#     # Return failure if it doesn't exist or is no executable
#     [ -x "$(command -v $1)" ] || return 1

#     return 0
# }

# --- install docker ---
install_docker() {
    info 'Installing docker...'

    # apt
    $SUDO apt update
    $SUDO apt install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    
    # Docker's key & repository
    $SUDO mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Install Docker Engine
    $SUDO apt update
    
    VERSION=5:20.10.23~3-0~ubuntu-jammy
    $SUDO apt install -y docker-ce=$VERSION docker-ce-cli=$VERSION containerd.io docker-compose-plugin    

    # Docker as non-root user
    # $SUDO groupadd docker
    $SUDO usermod -aG docker $USER
    # newgrp docker

    info 'docker installed. Log out and back in to update group membership.'
}

# --- install kubectl ---
install_kubectl() {
    info 'Installing kubectl...'
    VERSION="v1.26.0"

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
        if [ "$OS" = "\"Ubuntu\"" ]; then
            info "Installing $VERSION on Ubuntu..."

            curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl"

            # Checksum
            curl -LO "https://dl.k8s.io/$VERSION/bin/linux/amd64/kubectl.sha256"
            echo "$(cat kubectl.sha256) kubectl" | sha256sum --check
            rm -rf kubectl.sha256

            # Install
            $SUDO install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

            # kubctl as non-root user
            $SUDO groupadd kubelet
            $SUDO usermod -aG kubelet $USER
            # newgrp kubelet
        else
            fatal "Linux OS not supported."
        fi
    elif  [[ "$OSTYPE" == "darwin"* ]]; then
        info "Installing on Mac..."

        curl -LO "https://dl.k8s.io/release/$VERSION/bin/darwin/arm64/kubectl"

        # Checksum
        curl -LO "https://dl.k8s.io/release/$VERSION/bin/darwin/arm64/kubectl.sha256"
        echo "$(cat kubectl.sha256)  kubectl" | shasum -a 256 --check
        rm -rf kubectl.sha256

        # Install
        chmod +x ./kubectl
        $SUDO mv ./kubectl /usr/local/bin/kubectl
        $SUDO chown root: /usr/local/bin/kubectl
        
        # Check
        kubectl version --client
    else
        fatal "OS not supported."
    fi

    info 'kubectl installed.'
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
     info "Log out and back in to update group membership."
    fi
}

# --- install k3d ---
install_k3d() {
    info 'Installing k3d...'
    VERSION="v5.4.9"

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
        if [ "$OS" = "\"Ubuntu\"" ]; then
            curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=$VERSION bash
        else
            fatal "Linux OS not supported."
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=$VERSION bash
    else
        fatal "OS not supported."
    fi

    info 'k3d installed'
}

# --- main ---
programs=("docker" "kubectl" "k3d")

for prog in "${programs[@]}"
do
  if ! [ -x "$(command -v $prog)" ]
  then
    install_$prog
  fi
done
