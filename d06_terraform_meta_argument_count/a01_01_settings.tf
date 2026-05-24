# Terraform Settings block
terraform {
  required_version = "~> 1.15.3" //Production grade implementation - Best practices
  required_providers {
    google = {
      source = "hashicorp/google"
      #   version = "7.32.0"
      version = "~> 5.33.0"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = var.gcp_project //Projrct ID
  region  = var.gcp_region
}

