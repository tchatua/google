/*
google_compute_region_target_http_proxy
    Represents a RegionTargetHttpProxy resource, which is used by one or more forwarding rules to route incoming HTTP requests to a URL map.
*/

resource "google_compute_region_target_http_proxy" "http_proxy_app_alpha_lb" {
  name    = "${local.name}-http-proxy-app-alpha-lb"
  url_map = google_compute_region_url_map.region_urlmap_app_alpha_lb.id
}
