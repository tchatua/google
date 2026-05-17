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

# Terraform Provider-1 Block: us-central1
provider "google" {
  project = "a01-terraform-project" //Project ID
  region  = "us-central1"           //Iowa (Council Bluffs)
  alias   = "us-central1"
}

# Terraform Provider-2 Block: us-central1
provider "google" {
  project = "a01-terraform-project" //Project ID
  region  = "us-east1"              //South Carolina (Moncks Corner)
  alias   = "us-east1"
}

