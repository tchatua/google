# Terraform output values

/*Concepts covered
1. For loop with list
2. For loop with map
3. For loop with map advanced
4. Legacy splat operator (latest) - Returns list
5. Latest generalzed splat operator - returns the list
*/

output "vm_name_0" {
  description = "VM 1 name"
  value       = google_compute_instance.app1d06[0].name
}

output "vm_name_1" {
  description = "VM 2 name"
  value       = google_compute_instance.app1d06[1].name
}

# 1. For loop with list
output "for_output_list_vm_name" {
  description = "VM 1 name"
  value       = [for instance in google_compute_instance.app1d06 : instance.name]
}

# 2. For loop with map
output "for_output_map_vm_instance_id" {
  description = "Each server-assigned unique identifier of VM"
  value       = { for instance in google_compute_instance.app1d06 : instance.name => instance.instance_id }
}

# 3. For loop with map advanced
output "for_output_map_advanced_vm_instance_id" {
  description = "Each server-assigned unique identifier of VM"
  value       = { for c, instance in google_compute_instance.app1d06 : c => instance.instance_id }
}

# 4. Legacy splat operator (latest) - Returns list
output "legacy_splat_operator_vm_name" {
  description = "Legacy splat operator vm name"
  value       = google_compute_instance.app1d06.*.name
}

# 5. Latest generalzed splat operator - returns the list
output "latest_generalized_splat_operator_vm_name" {
  description = "Latest generalzed splat operator vm name"
  value       = google_compute_instance.app1d06[*].name
}

## Attributes
output "vm_id" {
  description = "VM instances ID"
  value       = google_compute_instance.app1d06[*].id
}


output "vm_external_ip" {
  description = "VM instances external IP"
  value       = google_compute_instance.app1d06[*].network_interface.0.access_config.0.nat_ip
}

# output "vm_internal_ip" {
#   description = "The internal ip address of the instance - VM instance external IP"
#   value       = google_compute_instance.app1d06[*].network_interface.0.network_ip
# }

output "vm_self_link" {
  description = "The URI of each VM"
  value       = google_compute_instance.app1d06[*].self_link
}

# Arguments
output "vm_machine_type" {
  description = "The boot disk for the instance"
  value       = google_compute_instance.app1d06[*].machine_type
}
# output "vm_name" {
#     description = "VM name"
#     value = google_compute_instance.app1d06.name
# }


/* Single Instance Outputs
## Attributes
output "vm_id" {
    description = "VM instance ID"
    value = google_compute_instance.app1d06.id
}
output "vm_external_ip" {
    description = "VM instance external IP"
    value = google_compute_instance.app1d06.network_interface.0.access_config.0.nat_ip 
}
output "vm_internal_ip" {
    description = "The internal ip address of the instance - VM instance external IP"
    value = google_compute_instance.app1d06.network_interface.0.network_ip
}
output "vm_instance_id" {
  description = "The server-assigned unique identifier of this VM"
  value = google_compute_instance.app1d06.instance_id
}
output "vm_self_link" {
  description = "The URI of the VM"
  value = google_compute_instance.app1d06.self_link
}
# Arguments
output "vm_machine_type" {
  description = "The boot disk for the instance"
  value = google_compute_instance.app1d06.machine_type
}
output "vm_name" {
    description = "VM name"
    value = google_compute_instance.app1d06.name
}
*/

