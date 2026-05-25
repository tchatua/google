# Outputs
/*
output "vm_image_project" {
  value = data.google_compute_image.my_image.project
}

output "vm_image_family" {
  value = data.google_compute_image.my_image.family
}

output "vm_image_name" {
  value = data.google_compute_image.my_image.name
}

output "vm_image_image_id" {
  value = data.google_compute_image.my_image.image_id
}

output "vm_image_status" {
  value = data.google_compute_image.my_image.status
}

output "vm_image_id" {
  value = data.google_compute_image.my_image.id
}

output "vm_image_self_link" {
  value = data.google_compute_image.my_image.self_link
}
*/
output "vm_image_info" {
  value = {
    project   = data.google_compute_image.my_image.project
    family    = data.google_compute_image.my_image.family
    name      = data.google_compute_image.my_image.name
    image_id  = data.google_compute_image.my_image.image_id
    status    = data.google_compute_image.my_image.status
    id        = data.google_compute_image.my_image.id
    self_link = data.google_compute_image.my_image.self_link
  }
}

