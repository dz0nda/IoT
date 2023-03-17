#! /bin/sh

function setup_server() {
    SERVER_URL=192.168.42.110
    IFACE=eth1
	SERVER_URL=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

	export INSTALL_K3S_EXEC="   --bind-address=${SERVER_URL} \
                                --flannel-iface=${IFACE} \
                                --write-kubeconfig-mode 644"
	curl -sfL https://get.k3s.io | sh -

	echo -n " * Waiting k3s "

	while [ ! -f /var/lib/rancher/k3s/server/node-token ]
	do
		sleep 1
        echo -n "."
	done

	echo " [ ok ]"
}

setup_server
