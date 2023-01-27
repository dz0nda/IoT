#! /bin/sh


function setup_root_ssh() {
    sudo passwd root

    mkdir -p /root/.ssh

    mv ./id_rsa.pub /root/.ssh/id_rsa.pub
    mv ./id_rsa     /root/.ssh/id_rsa
    cat /root/.ssh/id_rsa.pub >>  /root/.ssh/authorized_keys

    chmod 400  /root/.ssh/id_rsa*
    chmod 400  /root/.ssh/authorized_keys
    
    chown root:root  /root/.ssh/id_rsa*
    chown root:root  /root/.ssh/authorized_keys
}

function main() {
    setup_root_ssh
}

main
