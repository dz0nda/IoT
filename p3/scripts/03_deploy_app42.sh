#!/usr/bin/env bash

source ./helper.sh

APP_IP='0.0.0.0'
APP_PORT='8888'
APP_LOG='argocd.log'


deploy_app42() {
    info "Deploying App42..."

    # Add application to ArgoCD
    kubectl apply -f https://raw.githubusercontent.com/dz0nda/IoT/master/p3/app/application.yaml

    # Get ArgoCD password
    APP_IP=$(kubectl get svc -n dev | grep "app42" | cut -d' ' -f10)
    
    # Forward port 8080 to the ArgoCD server
    # Retrieve it with: ps -ef | grep "nohup" | grep -v "grep"
    nohup kubectl port-forward svc/argocd-server -n argocd $APP_PORT:$APP_PORT --address $APP_IP > $APP_LOG 2>&1 &

    info "App42 is running on http://$APP_IP:$APP_PORT"
}

deploy_app42