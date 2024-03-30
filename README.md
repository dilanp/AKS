
## Prerequisites.
- Azure CLI (via HomeBrew)
- PowerShell (via HomeBrew)
- Terraform (via HomeBrew)

## Login to the target Azure environment.
Run the following Azure CLI commands.
- az account show
- az login --tenant "5339548a-1c7e-4cba-907c-53871445fce0"
- az account set --subscription "fe88f330-5f60-4dcd-be53-bb19bf5c9434"

## Create the backend storage account.
First update the `backend/backend.tfvars` file with necessary values. Then, run the following commands in the given order.
- cd backend
- terraform init
- terraform validate
- terraform plan -var-file="backend.tfvars"
- terraform apply -var-file="backend.tfvars" -auto-approve

## Terraform commands.
- terraform init
- terraform validate
- terraform plan -var-file=aks.tfvars
- terraform apply -var-file=aks.tfvars -auto-approve

