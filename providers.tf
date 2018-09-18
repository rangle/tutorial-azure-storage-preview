provider "azurerm" {
  client_id = "${var.az_client_id}"
  client_secret = "${var.az_client_secret}"
  tenant_id = "${var.az_tenant_id}"
  subscription_id = "${var.az_subscription_id}"
}
