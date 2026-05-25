# Terraform outputs values

output "app1_mig_id" {
  description = "MIG identifier for the resource"
  value       = google_compute_region_instance_group_manager.app1_mig.id
}

output "app1_mig_instance_group" {
  description = "The full URL of the instance group created by the manager"
  value       = google_compute_region_instance_group_manager.app1_mig.instance_group
}

output "app1_mig_self_link" {
  description = "The URL of the created resource"
  value       = google_compute_region_instance_group_manager.app1_mig.self_link
}

output "app1_mig_status" {
  # description = "Current operational status of the App1 regional managed instance group"
  # description = "Reports the lifecycle and health status of the App1 regional instance group manager"
  # description = "Status output for the App1 regional instance group manager used to verify deployment and scaling state"
  description = "Displays the real‑time status of the App1 regional MIG, including whether instances are stable and running"
  value       = google_compute_region_instance_group_manager.app1_mig.status
}




