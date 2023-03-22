echo "Add k aliases"
#echo "alias k='kubectl'" | tee -a "/home/vagrant/.profile"
#chown vagrant:vagrant /home/vagrant/.profile
#chmod 644 /home/vagrant/.profile
cat /home/vagrant/aliases.sh >> /home/vagrant/.profile

echo "install K3S"
current_ip=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)
echo $current_ip
export INSTALL_K3S_EXEC="--bind-address=${current_ip} --flannel-iface=eth1 --write-kubeconfig-mode 644"
curl -sfL https://get.k3s.io | sh -

echo -n " * Waiting k3s "
while [ ! -f /var/lib/rancher/k3s/server/node-token ]
	do
		sleep 1
        echo -n "."
	done

sleep 10
echo " [ ok ]"
kubectl apply -f /home/vagrant/k3s_cluster/