/*
google_compute_region_instance_template
    Manages a VM instance template resource within GCE. 
    For more information see the official documentation and API. https://docs.cloud.google.com/compute/docs/instance-templates
*/

resource "google_compute_region_instance_template" "app1" {
  name        = "${local.name}-template-app1"
  description = "This template is used to create app1 server instances."
  tags        = ["ssh-tag", "http-tag"]
  # tags = [
  #   tolist(google_compute_firewall.fwssh.target_tags)[0],
  #   tolist(google_compute_firewall.fwhttp.target_tags)[0]
  # ]
  instance_description = "App1 VM Instances"
  machine_type         = var.machine_type
  # can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image = data.google_compute_image.my_image.self_link
    auto_delete  = true
    boot         = true
  }

  # Network
  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {
      // Ephemeral public IP
    }
  }

  # Install webserver
  metadata_startup_script = file("${path.module}/script.sh") # Webserver Installation

  labels = {
    environment = local.environment
  }

  metadata = {
    environment = local.environment
  }

}

