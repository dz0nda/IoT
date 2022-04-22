#! /bin/sh

cp /shared/auth/node-token ~/node-token

curl -sfL https://get.k3s.io \
| sh -s - agent \
            --server https://192.168.42.110:6443 \
            --node-name dzondaSW \
            --token-file ~/node-token
