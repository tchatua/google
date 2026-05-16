# Terraform Provider for Google
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.32.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "a01-terraform-project"
  region  = "us-central1"
}