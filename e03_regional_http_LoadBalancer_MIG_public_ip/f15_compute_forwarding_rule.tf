/*
google_compute_forwarding_rule
    A ForwardingRule resource. 
    A ForwardingRule resource specifies which pool of target virtual machines to forward a packet to 
    if it matches the given [IPAddress, IPProtocol, portRange] tuple.
*/

// Forwarding rule for Regional External Load Balancing
resource "google_compute_forwarding_rule" "forwarding_rule_app_alpha_lb" {
  depends_on            = [google_compute_subnetwork.regional_proxy_subnet]
  name                  = "${local.name}-forwarding-rule-app-alpha-lb"
  target                = google_compute_region_target_http_proxy.http_proxy_app_alpha_lb.id
  port_range            = "80"
  ip_protocol           = "TCP"
  ip_address            = google_compute_address.app_alpha_ip_lb.address
  load_balancing_scheme = "EXTERNAL_MANAGED"
  network               = google_compute_network.vpc.id
}
