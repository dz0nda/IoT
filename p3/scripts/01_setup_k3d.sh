#!/usr/bin/env bash

source ./helper.sh

setup_k3d() {
    info 'Creating k3d cluster and namespaces...'

    k3d cluster create p3
    kubectl create namespace argocd
    kubectl create namespace dev
}

