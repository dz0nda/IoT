#!/usr/bin/env bash

# Define aliases for common kubectl commands
alias k="kubectl"
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgn="kubectl get nodes"
alias ke="kubectl edit"
alias kd="kubectl delete"
alias kaf="kubectl apply -f"
alias kex="kubectl exec -it"

# Show logs for a pod and follow
alias klog='kubectl logs -f'

# Show resources sorted by usage
alias ktop='kubectl top'

# Show all resources in the current namespace
alias kall='kubectl get all'

# Delete all resources in the current namespace
alias kdeleteall='kubectl delete all --all'

# Forward a local port to a pod
alias kforward='kubectl port-forward'

# SSH into a pod
alias kssh='kubectl exec -it'

# Copy files to/from a pod
alias kcp='kubectl cp'

# Show detailed resource information
alias kdescribe='kubectl describe'

# List all namespaces
alias kns='kubectl get namespaces'

# Switch to a different namespace
alias kuse='kubectl config set-context $(kubectl config current-context) --namespace'

# Show a resource's YAML configuration
alias kyaml='kubectl get -o yaml'

# Run a command in a pod's container
alias krun='kubectl exec -it --'

# Get the pod running on a node
alias kgetpod='kubectl get pods -o jsonpath="{.items[0].metadata.name}" --field-selector spec.nodeName='

# Define aliases for common k3d commands
alias k3d-create='k3d cluster create'
alias k3d-delete='k3d cluster delete'
alias k3d-list='k3d cluster list'
alias k3d-start='k3d cluster start'
alias k3d-stop='k3d cluster stop'
