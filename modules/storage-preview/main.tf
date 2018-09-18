resource "null_resource" "storage-preview" {
  count = "${var.enable_static_website ? 1 : 0}"

  provisioner "local-exec" {
    command = "${path.module}/scripts/enable_static_web.sh"

    environment {
      AZURE_CLIENT_ID       = "${var.az_client_id}"
      AZURE_CLIENT_SECRET   = "${var.az_client_secret}"
      AZURE_TENANT_ID       = "${var.az_tenant_id}"
      AZURE_STORAGE_ACCOUNT = "${var.az_storage_account}"
      AZURE_STORAGE_KEY     = "${var.az_storage_key}"
      AZURE_RESOURCE_GROUP  = "${var.az_resource_group}"
      INDEX_DOCUMENT        = "${var.index_document}"
      ERROR_DOCUMENT        = "${var.error_document}"
    }
  }
}
