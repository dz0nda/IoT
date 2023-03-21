# p3

This part is about deploying applications through ArgoCD.

*This part can be setup without Vagrant.*

## Setup

1. Install the prequerisites with the script `00_install_prequerisites`. It will install `docker`, `kubectl` and `k3d`.

2. Setup `k3d` with the script `01_setup_k3d`. It will create a cluster and two namespaces: `argocd` and `dev`.

3. Setup `ArgoCD` with the script `02_setup_argocd`. It will install `ArgoCD` and expose the dashboard on the port `8080`.

4. Deploy the application with the script `03_deploy_app42.sh`. It will deploy the WilS's application and expose it on port `8888`.

## Scripts

- **00_install_prequerisites.sh**: contains installation for `docker`, `kubectl`, `k3d`. `DEBUG` variable can be set to show logs for executed commands.

- **01_setup_k3d.sh**: contains cluster and namespaces creation.

- **02_install_prequerisites.sh**: contains ArgoCD installation.

- **03_deploy_app42.sh**: contains application deployment.

- **aliases.sh**: contains useful aliases for `kubectl` and `k3d`.

- **helper.sh**: contains useful functions for scripts.
