/*
    google_compute_region_backend_service
        A Region Backend Service defines a regionally-scoped group of virtual machines that will serve traffic for load balancing.
Regional Backend Service (App Alpha)
    This backend service represents the regional Managed Instance Group (MIG)
        that will receive traffic from the Regional External Application Load Balancer.
            Key responsibilities:
                - Distributes traffic only to healthy VM instances (via the attached health check)
                - Uses HTTP as the load‑balancing protocol (L7 routing)
                - Operates under the EXTERNAL_MANAGED scheme required for Regional ALBs
                - Identifies backend ports using the named port "webserver"
            Backend block:
                - 'group' points to the MIG’s instance group resource
                - 'balancing_mode = UTILIZATION' spreads traffic based on VM CPU usage
                - 'capacity_scaler = 1.0' ensures the backend receives 100% of its allocated load
*/

resource "google_compute_region_backend_service" "app_alpha_backend_region_service_lb" {
  name                  = "${local.name}-app-alpha-backend-region-service-lb"
  health_checks         = [google_compute_region_health_check.app_alpha_health_check_lb.self_link]
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_name             = "webserver"

  backend {
    group           = google_compute_region_instance_group_manager.app1_mig.instance_group
    capacity_scaler = 1.0
    balancing_mode  = "UTILIZATION"
  }
}
