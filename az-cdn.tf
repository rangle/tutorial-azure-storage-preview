resource "azurerm_cdn_profile" "mytestapp-cdn" {
  # Name can have alphnumeric or hyphen but must start and end with alphanumeric
  name                = "${var.project}-${var.module}"
  location            = "${var.az_region}"
  resource_group_name = "${azurerm_resource_group.mytestapp-rg.name}"
  sku                 = "${var.az_cdn_type}"
}

# Generate Unique ID for CDN Endpoint
resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_cdn_endpoint" "mytestapp-cdn-ep" {
  # Name can have alphnumeric or hyphen but must start and end with alphanumeric
  # Use a random name or the same name as the storage account
  name = "${var.random_endpoint_name ? random_id.server.hex : azurerm_storage_account.mytestapp-sa.name}"

  profile_name        = "${azurerm_cdn_profile.mytestapp-cdn.name}"
  location            = "${var.az_region}"
  resource_group_name = "${azurerm_resource_group.mytestapp-rg.name}"

  # Leave this blank for static sites, otherwise use the storage container name
  origin_path = "${var.enable_static_website ? "" : "/${var.module}"}"

  # Use the static site endpoint or the storage container endpoint
  origin_host_header = "${var.enable_static_website ? "${module.storage-preview.primary_web_endpoint}" : "${azurerm_storage_account.mytestapp-sa.name}.blob.core.windows.net"}"

  origin {
    # Name can have alphnumeric or hyphen but must start and end with alphanumeric
    name      = "${azurerm_storage_account.mytestapp-sa.name}-${var.module}"

    # Use the static site endpoint or the storage container endpoint
    host_name = "${var.enable_static_website ? "${module.storage-preview.primary_web_endpoint}" : "${azurerm_storage_account.mytestapp-sa.name}.blob.core.windows.net"}"
  }
}

output "AZURE_CDN_ENDPOINT"{
  value = "https://${azurerm_cdn_endpoint.mytestapp-cdn-ep.name}.azureedge.net"
}
