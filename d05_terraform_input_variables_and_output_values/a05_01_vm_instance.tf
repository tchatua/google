#
resource "google_compute_instance" "app1d05" {
  name         = var.compute_instance_name 
  machine_type = var.machine_type
  zone         = var.compute_instance_zone 
  #   tags = ["ssh-tag", "http-tag"]
  tags = [
    tolist(google_compute_firewall.fwssh.target_tags)[0],
    tolist(google_compute_firewall.fwhttp.target_tags)[0]
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    # network    = google_compute_network.vpcd03.id
    subnetwork = google_compute_subnetwork.subnetd05.id
    access_config {
      // Ephemeral public IP
    }
  }
  # Webserver Installation
  metadata_startup_script = file("${path.module}/a05_02_script.sh")
}