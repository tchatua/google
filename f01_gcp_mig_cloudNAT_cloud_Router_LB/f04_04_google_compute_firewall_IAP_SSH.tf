resource "google_compute_firewall" "fw_iap_ssh" {
  name        = "${local.name}-allow-iap-ssh"
  network     = google_compute_network.vpc.id
  direction   = "INGRESS"
  priority    = 1000

  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["ssh-tag"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
