# Resource block: VPC
resource "google_compute_network" "vpcd03" {
  name                    = "vpc-d03"
  auto_create_subnetworks = false
}