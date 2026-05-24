resource "google_compute_route" "default_internet" {
  name             = "${local.name}-app1-default-internet-route"
  network          = google_compute_network.vpc.id
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
}
