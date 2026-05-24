# GCP Compute machine Type
variable "machine_type" {
  description = "Compute engine machine type"
  type        = string
  default     = "n2-standard-2"
}

variable "compute_instance_name" {
  description = "Compute engine machine name"
  type        = string
  default     = "my-app1-instance"
}
