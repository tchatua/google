/*
google_compute_region_instance_template
    Manages a VM instance template resource within GCE. 
    For more information see the official documentation and API. https://docs.cloud.google.com/compute/docs/instance-templates
------------------------------------------------------------------------------
Regional Instance Template (App1)
  Defines the VM configuration used by the Regional Managed Instance Group (MIG).
  Instance templates are immutable and serve as the source of truth for:
    - Machine type and boot disk image
    - Network interfaces and external IP assignment
    - Startup scripts for application/bootstrap installation
    - Network tags used for firewall rules (ssh-tag, http-tag)
    - Scheduling behavior and metadata/labels
  Any change to this template requires creating a NEW template version and
  updating the MIG to trigger a rolling update. Existing VMs do NOT inherit
  changes automatically.
*/

resource "google_compute_region_instance_template" "app1" {
  name        = "${local.name}-template-app1"
  description = "This template is used to create app1 server instances."
  /*
  tags        = [
    "ssh-tag", 
    "http-tag",
    "allow-health-check"
  ]
  */
  tags = [
    tolist(google_compute_firewall.fw_rule_ssh.target_tags)[0],
    tolist(google_compute_firewall.fw_rule_http.target_tags)[0],
    tolist(google_compute_firewall.fw_rule_health_check.target_tags)[0]
  ]
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
    /*
    access_config {
      // Ephemeral public IP
    }
    */
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

