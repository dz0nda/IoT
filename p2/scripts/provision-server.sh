#!/usr/bin/env sh

# Install k3s
export INSTALL_K3S_EXEC="--write-kubeconfig-mode 644"
curl -sfL https://get.k3s.io | sh -
