# Define Local values in terraform
locals {
  owners      = var.intern
  environment = var.environment
  name        = "${var.intern}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}