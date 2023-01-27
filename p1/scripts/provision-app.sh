#!/bin/bash

# Get the join token from the server
JOIN_TOKEN=$(ssh -o StrictHostKeyChecking=no -i ~/.vagrant.d/insecure_private_key vagrant@192.168.56.110 "sudo cat /var/lib/rancher/k3s/server/node-token")

# Join the app node to the k3s cluster
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$JOIN_TOKEN sh -
