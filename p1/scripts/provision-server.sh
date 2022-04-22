#! /bin/sh

curl -sfL https://get.k3s.io \
| sh -s - server \
            --write-kubeconfig-mode=644 \
            --node-name dzondaS

cp /var/lib/rancher/k3s/server/node-token /shared/auth/node-token
