#
resource "google_compute_instance" "app1d06" {
  # Meta-Argument: count
  count        = 2
  name         = "${var.compute_instance_name}-${count.index}"
  machine_type = var.machine_type
  # zone         = var.compute_instance_zone
  zone = data.google_compute_zones.available.names[count.index]
  tags = ["ssh-tag", "http-tag"]
  # tags = [
  #   tolist(google_compute_firewall.fwssh.target_tags)[0],
  #   tolist(google_compute_firewall.fwhttp.target_tags)[0]
  # ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    # network    = google_compute_network.vpcd03.id
    subnetwork = google_compute_subnetwork.subnetd06.id
    access_config {
      // Ephemeral public IP
    }
  }
  # Webserver Installation
  metadata_startup_script = file("${path.module}/script.sh")
}