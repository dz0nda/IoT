#! /bin/sh

# Copy the keys to the ssh folder
mv /shared/id_rsa*  /root/.ssh/

# Give root permissions to the keys
chmod 400 /root/.ssh/id_rsa*
chown root:root  /root/.ssh/id_rsa*

# Add the public key as authorized to connect the machine
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

# Give root permissions to the authorized keys
chmod 400 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys

# Add current node in /etc/hosts
echo "127.0.1.1 $(hostname)" >> /etc/hosts

# Add master node in /etc/hosts
echo "192.168.56.110 dzondaS" >> /etc/hosts

# Get current IP adress to launch k3S
current_ip=$(/sbin/ip -o -4 addr list enp0s8 | awk '{print $4}' | cut -d/ -f1)

# Get token
scp -o StrictHostKeyChecking=no root@dzondaS:/var/lib/rancher/k3s/server/token /tmp/token

# Launch k3s
curl -sfL https://get.k3s.io \
| sh -s - agent \
    --server https://kubemaster1:6443 \
    --node-name ${hostname} \
    --node-ip=${current_ip}
    --token-file /tmp/token
