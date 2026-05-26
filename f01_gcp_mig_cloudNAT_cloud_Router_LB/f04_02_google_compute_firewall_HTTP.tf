/*
# Resource: Firewall rule - HTTP port 80
    --------------------------------------------------------------------------------
    Firewall Rule: Allow HTTP (80, 8080)
    --------------------------------------------------------------------------------
    Allows public web traffic to reach VM instances tagged with "http-tag".

    Key points:
      • INGRESS rule permitting TCP traffic on ports 80 and 8080
          - Port 80: standard HTTP
          - Port 8080: alternate HTTP port (commonly used for app servers)
      • 'target_tags = ["http-tag"]' ensures only instances intended to serve
        web traffic receive this rule.
      • 'source_ranges = ["0.0.0.0/0"]' allows access from anywhere on the internet,
        which is expected for public-facing applications.
      • Priority 1000 keeps rule ordering consistent with other firewall rules.

    NOTE:
      For production environments, ensure only the necessary ports are exposed
      and that backend services are protected by proper load balancer routing.
    --------------------------------------------------------------------------------
*/
resource "google_compute_firewall" "fw_rule_http" {
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
