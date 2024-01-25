# Azure Load Balancer with Virtual Machine Scale Set

This Terraform script deploys an Azure Load Balancer with a Virtual Machine Scale Set as the backend pool. It also includes autoscaling configurations based on CPU metrics.

## Prerequisites
- Azure Subscription: You need an active Azure subscription.
- Terraform: Install Terraform on your local machine.
- SSH Key: Generate an public SSH key for your local machine

## Configuration
### 1. Clone this repository:
git clone <repository_url><br>
cd <repository_directory>
### 2. Update the terraform.tfvars file with your specific values:
Fill in your variables...<br>
rgname = "my-rg"         <br>
rg_location = "eastus"   <br>  

... (update other variables accordingly)
### 3. Add your public SSH key to the terraform.tfvars file:
first_public_key = "<your_public_key>"

## Usage
### 1. Initialize Terraform:
`terraform init`
### 2. Review the execution plan:
`terraform plan`
### 3. Apply the changes:
`terraform apply`

Confirm by typing **yes** when prompted.

## Clean Up
To avoid incurring charges, it's recommended to destroy the resources when they are no longer needed.<br>
`terraform destroy`

Confirm by typing **yes** when prompted.

## Note
- Ensure that your Azure CLI is authenticated and configured with the correct subscription before running Terraform commands.

- Make sure you have proper permissions in Azure to create and manage resources.

- Review and customize the variables in the terraform.tfvars file based on your requirements.

- Keep sensitive information like SSH keys and other secrets secure.
