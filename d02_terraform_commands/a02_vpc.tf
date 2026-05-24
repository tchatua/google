# resource: VPC
resource "google_compute_network" "vpc247" {
  project                 = "a01-terraform-project"
  name                    = "vpc-247"
  auto_create_subnetworks = false
}

