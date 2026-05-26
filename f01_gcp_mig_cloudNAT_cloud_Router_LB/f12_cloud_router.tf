/*
--------------------------------------------------------------------------------
Cloud Router
--------------------------------------------------------------------------------
    Creates a regional Cloud Router used for dynamic routing within the VPC.
    
    Key points:
      • Cloud Routers enable dynamic route exchange using BGP.
      • Required when configuring Cloud NAT, VPN tunnels, or interconnects that depend on dynamic routing.
      • Scoped to a specific region and attached to a single VPC network.
      • Does not perform routing by itself—functions as a control-plane component for managing route advertisements and BGP sessions.
    
    NOTE:
      A Cloud Router is typically paired with:
        - google_compute_router_nat (Cloud NAT)
        - google_compute_vpn_gateway / HA VPN
        - Dedicated or Partner Interconnect
*/

resource "google_compute_router" "cloud_router" {
  name    = "${local.name}-${var.gcp_region}-cloud-router"
  network = google_compute_network.vpc.name
  region  = var.gcp_region
}
