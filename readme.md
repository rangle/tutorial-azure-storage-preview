# Terraform Frontend Infrastructure Template

This project creates a static website using Azure Storage Containers and Azure CDN.

# Requirements
1. Configure an Azure Service Principal that will be used for programmatic access.
   See the following for details: https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html
2. A variables file: `terraform.tfvars` with correct values specific to your project.
   See variables.tf for descriptions and defaults.

```
# Account Settings
az_client_id       = ""
az_client_secret   = ""
az_tenant_id       = ""
az_subscription_id = ""
az_region          = "canadacentral"

# Tags
project     = ""
module      = ""
environment = "staging"

# Storage Options
az_storage_account_tier     = "Standard"
az_storage_replication_type = "LRS"
enable_static_website       = 1

# CDN Options
az_cdn_type = "Standard_Verizon"
random_endpoint_name = 0
```
# Getting Started
1. run `terraform init`
2. run `terraform plan` and review the plan
3. run `terraform apply`

# CI/CD
You will likely need to expose the following environment variables to your CI tool.
If you are enabling Static Website for your Storage Account, set AZURE_STORAGE_CONTAINER = literal string `$web`

```
export ARM_CLIENT_ID=<az_client_id>
export ARM_CLIENT_SECRET=<az_client_secret>
export ARM_TENANT_ID=<az_tenant_id>
export ARM_SUBSCRIPTION_ID=<az_subscription_id>

export AZURE_STORAGE_CONTAINER=<storage_container_name or $web>
export AZURE_STORAGE_ACCOUNT=<storage_account_name>
export AZURE_STORAGE_KEY=<storage_account_key>
```
