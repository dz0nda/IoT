#! /bin/sh

echo $PWD
echo $USER

# Copy the keys to the ssh folder
mv /shared/id_rsa.pub  /root/.ssh/id_rsa.pub
mv /shared/id_rsa  /root/.ssh/id_rsa

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

# Get current IP adress to launch k3S
current_ip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

# Launch k3s
curl -sfL https://get.k3s.io \
| sh -s - server \
    --cluster-init \
    --node-name ${hostname} \
    --tls-san ${hostname} \
    --bind-address=${current_ip} \
    --advertise-address=${current_ip} \
    --node-ip=${current_ip} \
    --no-deploy=traefik

# Wait for node to be ready and disable deployments on it
sleep 15
kubectl taint \
    --overwrite node ${hostname} node-role.kubernetes.io/master=true:NoSchedule