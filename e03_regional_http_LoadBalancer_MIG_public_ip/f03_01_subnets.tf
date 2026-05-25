# Resource block: subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${local.name}-subnet"
  region        = var.gcp_region
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.vpc.id
}
