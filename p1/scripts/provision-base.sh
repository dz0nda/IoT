#! /bin/sh

function setup_ssh_keys() {
    mv ./ssh/id_rsa.pub    .ssh/id_rsa.pub
    mv ./ssh/id_rsa        .ssh/id_rsa
    cat .ssh/id_rsa.pub     >> .ssh/authorized_keys

    chmod 400   .ssh/id_rsa*
    chmod 400   .ssh/authorized_keys
}

function setup_sshd() {
    mv ./ssh/sshd_config    /etc/ssh/sshd_config
    service sshd restart
}

function setup_alias() {
    cat /home/vagrant/aliases.sh >> /home/vagrant/.profile
}

setup_ssh_keys
setup_sshd
setup_alias