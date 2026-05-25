/*
google_compute_region_url_map
    UrlMaps are used to route requests to a backend service based on rules that you define for the host and path of an incoming URL.*/

resource "google_compute_region_url_map" "region_urlmap_app_alpha_lb" {
  name            = "${local.name}-regionurlmap-app-alpha-lb"
  description     = "route requests to a backend service"

  default_service = google_compute_region_backend_service.app_alpha_backend_region_service_lb.id
}
