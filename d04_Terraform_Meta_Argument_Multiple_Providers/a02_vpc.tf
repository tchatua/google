# Resource block: VPC
resource "google_compute_network" "vpcd04" {
  project                 = "a01-terraform-project" //Project ID
  name                    = "vpc-d04"
  auto_create_subnetworks = false
}