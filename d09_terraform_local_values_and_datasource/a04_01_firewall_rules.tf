# Resource: Firewall rule - SSH port 22
resource "google_compute_firewall" "fwssh" {
  name      = "${local.name}-fwrule-allow-ssh22"
  network   = google_compute_network.vpc.id
  priority  = 1000
  direction = "INGRESS"
  # source_ranges = ["173.61.6.206/32"]
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow SSH and ICMP only from my home IP"
  target_tags   = ["ssh-tag"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }
}

# Resource: Firewall rule - HTTP port 80
resource "google_compute_firewall" "fwhttp" {
  name          = "${local.name}-fwrule-allow-http80"
  network       = google_compute_network.vpc.id
  priority      = 1000
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow HTTP from the internet"
  target_tags   = ["http-tag"]
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
}
