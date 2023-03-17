#!/usr/bin/env sh

# Copy the keys to the ssh folder
mv ./id_rsa.pub .ssh/id_rsa.pub
mv ./id_rsa     .ssh/id_rsa

# Give root permissions to the keys
chmod 400 .ssh/id_rsa*
chown root:root .ssh/id_rsa*

# Add the public key as authorized to connect the machine
cat .ssh/id_rsa.pub >> .ssh/authorized_keys

# Give root permissions to the authorized keys
chmod 400 .ssh/authorized_keys
chown root:root .ssh/authorized_keys
