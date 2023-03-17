#!/usr/bin/env sh

# This script copies a folder from the host machine to the guest machine

HOST_FOLDER_PATH=$1
GUEST_FOLDER_PATH=$2

scp -r -o StrictHostKeyChecking=no $HOST_FOLDER_PATH vagrant@127.0.0.1:$GUEST_FOLDER_PATH
