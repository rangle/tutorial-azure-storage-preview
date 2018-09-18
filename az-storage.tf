resource "azurerm_resource_group" "mytestapp-rg" {
  name     = "${var.project}-${var.module}-${var.environment}"
  location = "${var.az_region}"
  tags = "${local.common_tags}"
}

resource "azurerm_storage_account" "mytestapp-sa" {
  # Consider the following when choosing account name:
  #   - you can only have one static website per account
  #   - or create multiple containers under the account
  #   - must be lowercase letters and/or numbers
  #   - must be between 3 and 24 characters
  #   - must be unique across the entire Azure service
  name                     = "${var.project}${var.module}${var.environment}"
  resource_group_name      = "${azurerm_resource_group.mytestapp-rg.name}"
  location                 = "${var.az_region}"
  account_tier             = "${var.az_storage_account_tier}"
  account_replication_type = "${var.az_storage_replication_type}"

  account_kind = "${var.enable_static_website ? "StorageV2" : "Storage"}"

  tags = "${local.storage_tags}"
}

module "storage-preview" {
  source = "./modules/storage-preview"

  az_client_id          = "${var.az_client_id}"
  az_client_secret      = "${var.az_client_secret}"
  az_tenant_id          = "${var.az_tenant_id}"
  az_storage_account    = "${azurerm_storage_account.mytestapp-sa.name}"
  az_storage_key        = "${azurerm_storage_account.mytestapp-sa.primary_access_key}"
  az_resource_group     = "${azurerm_resource_group.mytestapp-rg.name}"
  enable_static_website = "${var.enable_static_website}"
  index_document        = "${var.index_document}"
  error_document        = "${var.error_document}"
}

resource "azurerm_storage_container" "mytestapp-sa-con" {
  # Don't create container if using static website
  count = "${var.enable_static_website ? 0 : 1}"

  # Name must be unique within the associated storage account
  name                  = "${var.module}"
  resource_group_name   = "${azurerm_resource_group.mytestapp-rg.name}"
  storage_account_name  = "${azurerm_storage_account.mytestapp-sa.name}"
}

output "AZURE_STORAGE_ACCOUNT"{
  value = "${azurerm_storage_account.mytestapp-sa.name}"
}

output "AZURE_STORAGE_KEY"{
  value = "${azurerm_storage_account.mytestapp-sa.primary_access_key}"
}

output "AZURE_STORAGE_CONTAINER"{
  value = "${var.enable_static_website ? "$web" : "${var.module}"}"
}

output "AZURE_WEB_ENDPOINT" {
  value = "${module.storage-preview.primary_web_endpoint}"
}
