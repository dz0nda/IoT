#!/usr/bin/env sh

install_k3s_server() {
    current_ip=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

    export INSTALL_K3S_EXEC="--bind-address=${current_ip} --flannel-iface=eth1 --write-kubeconfig-mode 644"
    curl -sfL https://get.k3s.io | sh -

    echo -n " * Waiting k3s "

    while [ ! -f /var/lib/rancher/k3s/server/node-token ]
        do
            sleep 1
            echo -n "."
        done

    echo " [ ok ]"
}

install_k3s_agent() {
    SERVER_URL=192.168.42.110
    IFACE=eth1
    JOIN_TOKEN=$(ssh -o StrictHostKeyChecking=no -i /home/vagrant/.ssh/id_rsa vagrant@$SERVER_URL "sudo cat /var/lib/rancher/k3s/server/node-token")

    export INSTALL_K3S_EXEC="--flannel-iface=$IFACE"
    export K3S_URL=https://$SERVER_URL:6443
    export K3S_TOKEN=$JOIN_TOKEN

    curl -sfL https://get.k3s.io | sh -
}
