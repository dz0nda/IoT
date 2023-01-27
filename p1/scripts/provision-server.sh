#! /bin/sh

curl -sfL https://get.k3s.io \
| sh -s - server \
            --write-kubeconfig-mode=644 \
            --node-name dzondaS

cp /var/lib/rancher/k3s/server/node-token /shared/auth/node-token

#! /bin/sh

echo $(ls)
echo $PWD
echo $USER

# Add current node in /etc/hosts
# echo "127.0.1.1 $(hostname)" >> /etc/hosts

# Get current IP adress to launch k3S
current_ip=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

# secret='123secret'
# server_url="$1"


# export INSTALL_K3S_EXEC="--bind-address=${current_ip} --node-external-ip=${current_ip} --flannel-iface=eth1"
# curl -sfL https://get.k3s.io | sh -

# echo -n " * Waiting k3s..."

# while [ ! -f /var/lib/rancher/k3s/server/node-token ]
# 	do
# 		sleep 1
#         echo -n "."
# 	done

# echo " [ ok ]"

TOKEN="THISISTHETOKEN"
echo "Server: $TOKEN"

# # Launch k3s
# curl -sfL https://get.k3s.io | K3S_TOKEN=$secret sh -s - server --cluster-init --node-ip=${current_ip} --bind-address=${current_ip} 
# | sh -s - server \
#     $current_ip --cluster-secret $secret
    # --node-name ${hostname} \
    # --tls-san ${hostname} \
    # --bind-address=${current_ip} \
    # --advertise-address=${current_ip} \
    # --node-ip=${current_ip} \
    # --no-deploy=traefik

# Wait for node to be ready and disable deployments on it
# sleep 15
# kubectl taint \
#     --overwrite node ${hostname} node-role.kubernetes.io/master=true:NoSchedule
