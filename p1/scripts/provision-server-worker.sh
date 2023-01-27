#! /bin/sh

cp /shared/auth/node-token ~/node-token

curl -sfL https://get.k3s.io \
| sh -s - agent \
            --server https://192.168.42.110:6443 \
            --node-name dzondaSW \
            --token-file ~/node-token

#! /bin/sh

# # Add current node in /etc/hosts
# echo "127.0.1.1 $(hostname)" >> /etc/hosts

# # Add master node in /etc/hosts
# echo "192.168.56.110 dzondaS" >> /etc/hosts

# Get current IP adress to launch k3S
# current_ip=$(/sbin/ip -o -4 addr list enp0s8 | awk '{print $4}' | cut -d/ -f1)

# Get token
# scp -o StrictHostKeyChecking=no root@dzondaS:/var/lib/rancher/k3s/server/token /tmp/token
# scp -o StrictHostKeyChecking=no root@192.168.56.110:/var/lib/rancher/k3s/server/token ./

# export K3S_TOKEN_FILE=/home/vagrant/token
# export K3S_URL=https://192.168.56.110:6443
# export INSTALL_K3S_EXEC="--flannel-iface=eth1"

# curl -sfL https://get.k3s.io | sh -


echo "Agent: $1"

# secret='123secret'

# # Launch k3s
# curl -sfL https://get.k3s.io \
# | sh -s - agent \
#     --server https://192.168.56.110:6443 \
#     --cluster-secret $secret
