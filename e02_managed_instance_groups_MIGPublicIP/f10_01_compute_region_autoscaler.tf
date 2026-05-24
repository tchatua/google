/*
    google_compute_region_autoscaler
        Represents an Autoscaler resource.
            Autoscalers allow me to automatically scale virtual machine instances 
            in managed instance groups (MIG) according to an autoscaling policy that I define.
*/

resource "google_compute_region_autoscaler" "app1" {
  name = "${local.name}-app1-asg"
  #   region = "us-central1"
  target = google_compute_region_instance_group_manager.app1.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.9
    }
  }
}
