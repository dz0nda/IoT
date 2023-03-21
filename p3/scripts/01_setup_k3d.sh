#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/../../utils/helper.sh

setup_k3d() {
    info 'Creating k3d cluster and namespaces...'

    k3d cluster create p3
    kubectl create namespace argocd
    kubectl create namespace dev
}

setup_k3d
