# Local values
locals {
  owners        = var.business_division
  environment   = var.environment
  name          = "${var.business_division}-${var.environment}"
  administrator = var.admin_email
  # name = "${local.owners}-${local.environment}"
  common_tags = {
    owners        = local.owners
    environment   = local.environment
    administrator = local.administrator
  }
}