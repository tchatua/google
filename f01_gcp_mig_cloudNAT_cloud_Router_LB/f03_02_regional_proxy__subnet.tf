/* 
  Resource: Regional Proxy-Only Subnet
    Required for Regional External Application Load Balancers.
      This subnet provides internal IPs for Envoy proxy instances that:
        - Terminate client connections at the load balancer
        - Initiate new connections to backend services
        - Handle L7 routing (URL maps, host rules, header rules)
        - Support SSL termination and advanced traffic processing
      The 'purpose = "REGIONAL_MANAGED_PROXY"' and 'role = "ACTIVE"' settings
      ensure this subnet is reserved exclusively for the load balancer’s proxy layer.
*/

resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name          = "${local.name}-regional-proxy-subnet"
  region        = var.gcp_region
  ip_cidr_range = "10.3.0.0/16"
  network       = google_compute_network.vpc.id
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"

}
