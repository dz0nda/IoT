#!/usr/bin/env sh

kubectl apply -f manifests/app1/configmap.yml
kubectl apply -f manifests/app1/deployment.yml
kubectl apply -f manifests/app1/service.yml
kubectl apply -f manifests/app1/ingress.yml
