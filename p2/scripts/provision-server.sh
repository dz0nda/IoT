#! /bin/sh

# Add current node in /etc/hosts
curl -sfL https://get.k3s.io \
| sh -s - server \
            --write-kubeconfig-mode=644

echo "$(hostname) is provisioned."
