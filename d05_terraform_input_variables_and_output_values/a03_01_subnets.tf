# Resource block: subnet
resource "google_compute_subnetwork" "subnetd05" {
  name          = "subnet-d05"
  region        = var.gcp_region
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.vpcd05.id
}