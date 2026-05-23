# Terraform Output Values
# Output - For with list
output "for_output_list_vm_name" {
  description = "For Loop with List"
  value       = [for instance in google_compute_instance.app1 : instance.name]
}

# Output - For Loop with Map 
output "for_output_map_vm_instance_id" {
  description = "For Loop with Map1"
  value       = { for instance in google_compute_instance.app1 : instance.name => instance.instance_id }
}

# Output - VM External IPs
output "vm_external_ips" {
  description = "VM Instance Names -> VM External IPs"
  value       = { for instance in google_compute_instance.app1 : instance.name => instance.network_interface.0.access_config.0.nat_ip }
}
