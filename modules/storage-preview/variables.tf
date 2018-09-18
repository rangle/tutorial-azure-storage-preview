variable "az_client_id" {
  description = "The client ID to use. It can also be sourced from the ARM_CLIENT_ID environment variable."
}
variable "az_client_secret" {
  description = "The client secret to use. It can also be sourced from the ARM_CLIENT_SECRET environment variable."
}
variable "az_tenant_id" {
  description = "The tenant ID to use. It can also be sourced from the ARM_TENANT_ID environment variable."
}
variable "az_storage_account" {
  description = "The StorageV2 account to enable static website preview."
}
variable "az_storage_key" {
  description = "The storage account primary access key."
}
variable "az_resource_group" {
  description = "The resource group associated with the storage account."
}
variable "enable_static_website" {
  description = "Enables Static Website Storage. This is currently in Preview."
}
variable "index_document" {
  description = "Name of root index document file."
  default = "index.html"
}
variable "error_document" {
  description = "Name of error document file."
  default = "404.html"
}
