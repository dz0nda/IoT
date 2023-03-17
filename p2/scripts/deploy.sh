#!/usr/bin/env sh

apps=[]

function load_values() {
    if [ ! -f "/Users/dzonda/Dev/IoT/p2/manifests/values.yml" ]; then
        echo "Error: values.yaml does not exist"
        exit 1
    fi

    file_contents=$(cat /Users/dzonda/Dev/IoT/p2/manifests/values.yml)
    apps=$(echo "$file_contents" | yq -r '.apps')
}

function deploy() {
    load_values

    for app in apps:
        

    # kubectl apply -f manifests/app1/configmap.yml
    # kubectl apply -f manifests/app1/deployment.yml
    # kubectl apply -f manifests/app1/service.yml
    # kubectl apply -f manifests/app1/ingress.yml
}

deploy
