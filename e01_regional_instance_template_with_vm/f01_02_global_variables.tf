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

# Environment variable
variable "environment" {
  description = "Environment variable used as prefix"
  type        = string
  default     = "dev"
}

# Business division
variable "business_division" {
  description = "Business division in which this infrsatructure belong"
  type        = string
  default     = "TchatuaLab"
}

# Email contact
variable "admin_email" {
  description = "Email of Terraform administrator"
  type        = string
  default     = "tchattua@gmail.com"
}




