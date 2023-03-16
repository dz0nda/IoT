#! /bin/sh

# curl -sfL https://get.k3s.io \
# | sh -s - server \
#             --write-kubeconfig-mode=644 \
#             --node-name dzondaS

# cp /var/lib/rancher/k3s/server/node-token /shared/auth/node-token

# NEW

#!/usr/bin/env sh

# Get current IP adress to launch k3S
current_ip=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

export INSTALL_K3S_EXEC="--bind-address=${current_ip} --flannel-iface=eth1 --write-kubeconfig-mode 644"
curl -sfL https://get.k3s.io | sh -

sleep 10

kubectl wait --for=condition=ready node --all --timeout=120s
# echo -n " * Waiting k3s "

# while [ ! -f /var/lib/rancher/k3s/server/node-token ]
# 	do
# 		sleep 1
#         echo -n "."
# 	done

# echo " [ ok ]"
