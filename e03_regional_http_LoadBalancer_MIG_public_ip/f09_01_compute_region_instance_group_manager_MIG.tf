/*
    google_compute_region_instance_group_manager
        The Google Compute Engine Regional Instance Group Manager API creates and manages pools of 
        homogeneous Compute Engine virtual machine instances from a common instance template.
*/

resource "google_compute_region_instance_group_manager" "app1_mig" {
  name = "${local.name}-app1-mig"

  base_instance_name        = "app"
  region                    = var.gcp_region
  distribution_policy_zones = data.google_compute_zones.available.names
  # Instance Template
  version {
    instance_template = google_compute_region_instance_template.app1.self_link
  }
  # Named Port
  named_port {
    name = "webserver"
    port = 80
  }
  # Auto Healing
  auto_healing_policies {
    health_check      = google_compute_region_health_check.app1.id
    initial_delay_sec = 300
  }

}

