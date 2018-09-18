data "external" "fetch_primary_web_endpoint" {
  program = ["bash", "${path.module}/scripts/fetch_static_endpoint.sh"]

  query = {
    az_resource_group = "${var.az_resource_group}"
    az_storage_account = "${var.az_storage_account}"
  }
}
