/*
Resource: Firewall rule - SSH port 22
    --------------------------------------------------------------------------------
    Firewall Rule: Allow SSH (22) + ICMP
    --------------------------------------------------------------------------------
    Provides secure administrative access to VM instances tagged with "ssh-tag".

    Key points:
      • INGRESS rule allowing:
            - TCP/22 for SSH access
            - ICMP for ping and basic network diagnostics
      • 'target_tags = ["ssh-tag"]' ensures the rule applies ONLY to instances explicitly tagged for SSH access.
      • 'source_ranges' is restricted to my home IP (recommended for security). Replace with additional trusted CIDRs as needed.
      • Priority 1000 keeps ordering predictable relative to other firewall rules.

    NOTE:
      Always restrict SSH access to known, trusted IP addresses in production
      environments. Avoid using 0.0.0.0/0 unless absolutely necessary.
    --------------------------------------------------------------------------------      
*/
resource "google_compute_firewall" "fw_rule_ssh" {
  name          = "${local.name}-fwrule-allow-ssh22"
  network       = google_compute_network.vpc.id
  priority      = 1000
  direction     = "INGRESS"
  source_ranges = ["173.61.6.206/32"]
  # source_ranges = ["0.0.0.0/0"]
  description = "Allow SSH and ICMP only from my home IP"
  target_tags = ["ssh-tag"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }
}
