#! /bin/sh

# Copy the keys to the ssh folder
mv /tmp/id_rsa*  /root/.ssh/

# Give root permissions to the keys
chmod 400 /root/.ssh/id_rsa*
chown root:root  /root/.ssh/id_rsa*

# Add the public key as authorized to connect the machine
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

# Give root permissions to the authorized keys
chmod 400 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys
