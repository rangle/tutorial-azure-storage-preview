locals {
  # Common tags to attach to resources
  common_tags = {
    Project     = "${var.project}"
    Name        = "${var.module}"
    Environment = "${var.environment}"
  }

  storage_tags = {
    StaticWeb = "${var.enable_static_website}"
  }
}
