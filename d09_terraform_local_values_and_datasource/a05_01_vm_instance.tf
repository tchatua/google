#
resource "google_compute_instance" "app1" {
  # Meta-Argument: for_each
  for_each = var.zone_machine_map
  # name         = "${var.compute_instance_name}-${each.key}-${each.value}"
  name         = "${var.compute_instance_name}-${each.key}"
  machine_type = each.value
  zone         = each.key # I can also use each.value because for list items each.key == each.value
  tags         = ["ssh-tag", "http-tag"]
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
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script   = file("${path.module}/script.sh") # Webserver Installation
  allow_stopping_for_update = true                             # to stop the VM automatically
}