# Resource block: subnet
resource "google_compute_subnetwork" "subnetd03" {
  name          = "subnet-d03"
  region        = "us-central1"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.vpcd03.id
}