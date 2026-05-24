# Global variables

# GCP project
variable "gcp_project" {
  description = "Project in which GCP resources is created"
  type        = string
  default     = "a01-terraform-project"
}

# GCP region
variable "gcp_region" {
  description = "Region in which GCP resources is created"
  type        = string
  default     = "us-central1" //Iowa (Council Bluffs)
}



