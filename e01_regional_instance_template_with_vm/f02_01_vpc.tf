# Resource block: VPC
resource "google_compute_network" "vpc" {
  # name                    = var.vpc_name # "vpc-d03"
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}