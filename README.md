
## Prerequisites
- Azure CLI (via HomeBrew)
- Terraform (via HomeBrew)

## Azure CLI commands
- az account show
- az login --tenant "5339548a-1c7e-4cba-907c-53871445fce0"
- az account set --subscription "fe88f330-5f60-4dcd-be53-bb19bf5c9434"

## Terraform commands
- terraform init
- terraform validate
- terraform plan -var-file=aks.tfvars
- terraform apply -var-file=aks.tfvars -auto-approve

