#!/bin/bash

function setup_worker() {
    SERVER_URL=192.168.42.110
    IFACE=eth1
    JOIN_TOKEN=$(ssh -o StrictHostKeyChecking=no -i /home/vagrant/.ssh/id_rsa vagrant@$SERVER_URL "sudo cat /var/lib/rancher/k3s/server/node-token")

    export INSTALL_K3S_EXEC="--flannel-iface=$IFACE"
    export K3S_URL=https://$SERVER_URL:6443
    export K3S_TOKEN=$JOIN_TOKEN

    curl -sfL https://get.k3s.io | sh -
}

setup_worker
