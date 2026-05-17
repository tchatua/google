# Resource block: VPC
resource "google_compute_network" "vpcd05" {
  name                    = var.vpc_name # "vpc-d03"
  auto_create_subnetworks = false
}