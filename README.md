
## Prerequisites.
- Azure CLI (via HomeBrew)
- PowerShell (via HomeBrew)
- Terraform (via HomeBrew)
- Kubernetes command-line tool: kubectl (via HomeBrew)
- Visual Studio Code with the following plugins installed.
  - Azure Accouny by Microsoft
  - Kubernetes by Microsoft
  - Azure Kubernetes Service by Microsoft
  - PowerShell by Microsoft
  - HashiCorp Terraform by HashiCorp
  - YAML by RedHat

## Login to the target Azure environment.
Run the following Azure CLI commands.
- az account show
- az login --tenant "5339548a-1c7e-4cba-907c-53871445fce0"
- az account set --subscription "fe88f330-5f60-4dcd-be53-bb19bf5c9434"

## Create the backend infrastructure.
First update the `backend/backend.tfvars` file with necessary values. Then, run the following commands in the given order.
- cd ./backend/
- terraform init
- terraform validate
- terraform plan -var-file="backend.tfvars"
- terraform apply -var-file="backend.tfvars" -auto-approve

## Update backend details.
Once the backend Terraform configuration has been deployed, please update the "azurerm" backend section in the `aks/main.tf` file with the newly created Azure Storage Account backend details.

## Deploy the AKS cluster.
Once the backend has been configured, run the following commands in the given order.
- cd ./aks/
- terraform init
- terraform validate
- terraform plan -var-file="aks.tfvars"
- terraform apply -var-file="aks.tfvars" -auto-approve

## Connect to the AKS Cluster using `kubectl`.
Simply go to the `Overview` blade of the AKS cluster and click on the `Connect` link at the top of the page. The required commands should be available. For an example;
- az aks get-credentials --resource-group rg-dilan-aks-cluster --name dilan-aks-cluster --overwrite-existing

## Useful `kubectl` commands.
- kubectl api-resources -o wide
- kubectl apply -f file_name.yaml
- kubectl get deploy
- kubectl get svc
- kubectl get rs
- kubectl get pod
- kubectl get cm
- kubectl get ds -A
- kubectl get secret
- describe node node_name


### Connect to AKS cluster nodes for maintenance or troubleshooting.
https://learn.microsoft.com/en-us/azure/aks/node-access

### Inspect the kubelet logs and service at Nodes.
- First connect to the node using instructions above.
- journalctl -u kubelet -o cat
- systemctl status kubelet

## Destroy the AKS cluster and backend infrastructure.
Run the following commands in the given order.
- cd ./aks/
- terraform destroy -var-file="aks.tfvars" -auto-approve
- cd ../backend/
- terraform destroy -var-file="backend.tfvars" -auto-approve
- cd ..