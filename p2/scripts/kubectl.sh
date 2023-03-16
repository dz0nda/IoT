install_kubectl() {
    info Installing kubectl...

    VERSION=v1.26.0
    curl -LO "https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl"

    # Checksum
    curl -LO "https://dl.k8s.io/${VERSION}/bin/linux/amd64/kubectl.sha256"
    echo "$(cat kubectl.sha256) kubectl" | sha256sum --check
    rm -rf kubectl.sha256

    # Install
    $SUDO install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    # kubctl as non-root user
    $SUDO groupadd kubelet
    $SUDO usermod -aG kubelet $USER
    newgrp kubelet

    info kubectl installed
}
