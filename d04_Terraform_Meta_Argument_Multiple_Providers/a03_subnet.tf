# Resource block: subnet in us-central1
resource "google_compute_subnetwork" "subnetcentral1d04" {
  provider      = google.us-central1
  name          = "subnet-central1-d04"
  ip_cidr_range = "10.3.0.0/16"
  network       = google_compute_network.vpcd04.id
}

# Resource block: subnet in us-east1
resource "google_compute_subnetwork" "subneteast1d04" {
  provider      = google.us-east1
  name          = "subnet-east1-d04"
  ip_cidr_range = "10.4.0.0/16"
  network       = google_compute_network.vpcd04.id
}

