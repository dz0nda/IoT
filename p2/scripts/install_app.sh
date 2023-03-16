#!/usr/bin/env sh

kubectl create configmap test-html --from-file index.html

HTML_FILE_PATH=/home/vagrant/app/index.html kubectl apply -f manifests/app1/configmap.yml
kubectl apply -f manifests/app1/deployment.yml
kubectl apply -f manifests/app1/service.yml
kubectl apply -f manifests/app1/ingress.yml
