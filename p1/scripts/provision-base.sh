#! /bin/sh

function setup_ssh() {
    mv ./auth/id_rsa.pub    .ssh/id_rsa.pub
    mv ./auth/id_rsa        .ssh/id_rsa
    cat .ssh/id_rsa.pub >>  .ssh/authorized_keys

    chmod 400   .ssh/id_rsa*
    chmod 400   .ssh/authorized_keys
    echo "PasswordAuthentification no" | tee /etc/ssh/sshd_config
    service sshd restart
}

setup_ssh
