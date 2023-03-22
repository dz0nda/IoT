#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/helper.sh

clean_p3() {
  # Remove Docker
  $SUDO apt-get remove docker docker-engine docker.io containerd runc

  # Remove Kubectl
  $SUDO rm -rf /user/local/bin/kubectl

  # Remove k3d
  $SUDO rm -rf /user/local/bin/k3d
}

clean_p3
