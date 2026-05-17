# Terraform output values

## Attributes
output "vm_id" {
    description = "VM instance ID"
    value = google_compute_instance.app1d05.id
}

output "vm_external_ip" {
    description = "VM instance external IP"
    value = google_compute_instance.app1d05.network_interface.0.access_config.0.nat_ip 
}

output "vm_internal_ip" {
    description = "The internal ip address of the instance - VM instance external IP"
    value = google_compute_instance.app1d05.network_interface.0.network_ip
}

output "vm_instance_id" {
  description = "The server-assigned unique identifier of this VM"
  value = google_compute_instance.app1d05.instance_id
}

output "vm_self_link" {
  description = "The URI of the VM"
  value = google_compute_instance.app1d05.self_link
}

# Arguments
output "vm_machine_type" {
  description = "The boot disk for the instance"
  value = google_compute_instance.app1d05.machine_type
}

output "vm_name" {
    description = "VM name"
    value = google_compute_instance.app1d05.name
}



