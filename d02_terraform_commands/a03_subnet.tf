resource "google_compute_subnetwork" "subnet247" {
  name          = "subnet-247-1"
  region        = "us-central1"
  network       = google_compute_network.vpc247.id // VPC ID
  ip_cidr_range = "10.2.0.0/16"
}