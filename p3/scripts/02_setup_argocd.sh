#!/usr/bin/env bash

source ./scripts/helper.sh

ARGOCD_VERSION='v2.6.6'
ARGOCD_IP='0.0.0.0'
ARGOCD_PORT='8080'
ARGOCD_LOG='argocd.log'


setup_argocd() {
    info "Installing ArgoCD $ARGOCD_VERSION..."

    # Install ArgoCD and wait for it to be ready
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/$ARGOCD_VERSION/manifests/install.yaml
    kubectl wait -n argocd pods --all --for=condition=Ready --timeout=-1s

    # Get ArgoCD password
    ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
    
    # Forward port 8080 to the ArgoCD server
    # Retrieve it with: ps -ef | grep "nohup" | grep -v "grep"
    nohup kubectl port-forward svc/argocd-server -n argocd $ARGOCD_PORT:443 --address $ARGOCD_IP > $ARGOCD_LOG 2>&1 &
    # screen -dmS argocd-port-forward bash -c "kubectl port-forward svc/argocd-server -n argocd $ARGOCD_PORT:443 --address $ARGOCD_IP > $ARGOCD_LOG 2>&1"
    # screen -r kubectl-port-forward -X detach


    info "ArgoCD is running on https://$ARGOCD_IP:$ARGOCD_PORT"
    info "ArgoCD username: admin"
    info "ArgoCD password: $ARGOCD_PASSWORD"

    info 'Done'
}

setup_argocd
