output "app_alpha_lb_static_ip_address" {
  description = "The static IP address of the load balancer."
  value       = google_compute_address.app_alpha_ip_lb.address
}

output "app_alpha_lb_backend_service_self_link" {
  description = "The self link of the backend service."
  value       = google_compute_region_backend_service.app_alpha_backend_region_service_lb.self_link
}

output "app_alpha_lb_url_map_self_link" {
  description = "The self link of the URL map."
  value       = google_compute_region_url_map.region_urlmap_app_alpha_lb.self_link
}

output "app_alpha_lb_target_http_proxy_self_link" {
  description = "The self link of the target HTTP proxy."
  value       = google_compute_region_target_http_proxy.http_proxy_app_alpha_lb.self_link
}

output "app_alpha_lb_forwarding_rule_ip_address" {
  description = "The IP address of the forwarding rule."
  value       = google_compute_forwarding_rule.forwarding_rule_app_alpha_lb.ip_address
}
