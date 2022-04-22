#! /bin/sh

# Set up ssh keys
mkdir -p /root/.ssh
mv /tmp/id_vagrant*  /root/.ssh/

chmod 400 /root/.ssh/id_vagrant*
chown root:root /root/.ssh/id_vagrant*

cat /root/.ssh/id_vagrant.pub >> /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys
