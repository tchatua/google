/*
    google_compute_address
        Represents an Address resource.
            Each virtual machine instance has an ephemeral internal IP address and, optionally, an external IP address. 
            To communicate between instances on the same network, you can use an instance's internal IP address. 
            To communicate with the Internet and instances outside of the same network, you must specify the instance's external IP address.
            
            Internal IP addresses are ephemeral and only belong to an instance for the lifetime of the instance; 
            if the instance is deleted and recreated, the instance is assigned a new internal IP address, 
            either by Compute Engine or by you. External IP addresses can be either ephemeral or static.
*/

resource "google_compute_address" "app_alpha_ip_lb" {
  name   = "${local.name}-app-alpha-regional-static-ip-lb"
  region = var.gcp_region
}

