# ================
# Account Settings
# ================
variable "az_client_id" {
  description = "The client ID to use. It can also be sourced from the ARM_CLIENT_ID environment variable."
}
variable "az_client_secret" {
  description = "The client secret to use. It can also be sourced from the ARM_CLIENT_SECRET environment variable."
}
variable "az_tenant_id" {
  description = "The tenant ID to use. It can also be sourced from the ARM_TENANT_ID environment variable."
}
variable "az_subscription_id" {
  description = "The subscription ID to use. It can also be sourced from the ARM_SUBSCRIPTION_ID environment variable."
}
variable "az_region" {
  description = "The default region to use for provisioning resources."
  default = "canadacentral"
}


# ====
# Tags
# ====
variable "project" {
  description = "The project label to tag resources with."
}
variable "module" {
  description = "The module or sub-project label to tag resources with."
}
variable "environment" {
  description = "The environment label to tag resources with."
  default = "development"
}


# ===============
# Storage Options
# ===============
variable "az_storage_account_tier" {
  description = "Storage account tier [Standard|Premium]"
  default = "Standard"
}
variable "az_storage_replication_type" {
  description = "Storage replication type [LRS|GRS|RAGRS|ZRS]"
  default = "LRS"
}
variable "enable_static_website" {
  description = "Enables Static Website Storage. This is currently in Preview."
  default = 1
}
variable "index_document" {
  description = "Name of root index document file."
  default = "index.html"
}
variable "error_document" {
  description = "Name of error document file."
  default = "404.html"
}

# ===========
# CDN Options
# ===========
# Standard_Microsoft - 10 mins to complete propagation
# Standard_Verizon or Premium_Verizon - 90 mins to complete propagation
# Standard_Akamai - 1 min to complete propagation
variable "az_cdn_type" {
  description = "CDN type [Standard_Akamai|Standard_ChinaCdn|Standard_Microsoft|Standard_Verizon|Premium_Verizon]"
  default = "Standard_Microsoft"
}
variable "random_endpoint_name" {
  description = "Generate a random CDN endpoint name for uniqueness."
  default = 1
}
