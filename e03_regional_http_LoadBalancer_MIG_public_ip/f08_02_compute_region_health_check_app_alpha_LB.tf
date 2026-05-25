/*
    google_compute_region_health_check
        Health Checks determine whether instances are responsive and able to do work. 
        They are an important part of a comprehensive load balancing configuration, 
        as they enable monitoring instances behind load balancers.

        Health Checks poll instances at a specified interval. 
        Instances that do not respond successfully to some number of probes in a row are marked as unhealthy. 
        No new connections are sent to unhealthy instances, though existing connections will continue. 
        The health check will continue to poll unhealthy instances. 
        If an instance later responds successfully to some number of consecutive probes, 
        it is marked healthy again and can receive new connections.
    ------------------------------------------------------------------------------        
    Regional TCP Health Check for LB
    This health check is used by regional load balancers or instance groups to
    verify that the App1 service is healthy and serving traffic. 
    It performs an HTTP/2 check on port 80 and expects a valid response from /index.html.
    Key settings:
    - timeout_sec: How long to wait before marking a check as failed
    - check_interval_sec: How frequently to run the health check
    - healthy_threshold: Number of consecutive successes required to mark healthy
    - unhealthy_threshold: Number of consecutive failures required to mark unhealthy
*/

resource "google_compute_region_health_check" "app_alpha_health_check_lb" {
  name                = "${local.name}-app-alpha-health-check-lb"
  timeout_sec         = 5
  check_interval_sec  = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  /*
  http2_health_check {
    request_path = "/index.html"
    port         = 80
  }
  */
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}