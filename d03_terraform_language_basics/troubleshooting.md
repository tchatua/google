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
  project = "a01-terraform-project"
  region  = "us-central1"
}


# Resource block: VPC
resource "google_compute_network" "vpcd03" {
  name                    = "vpc-d03"
  auto_create_subnetworks = false
}


# Resource block: subnet
resource "google_compute_subnetwork" "subnetd03" {
  name          = "subnet-d03"
  region        = "us-central1"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.vpcd03.id
}

# Resource: Firewall rule - SSH port 22
resource "google_compute_firewall" "fwssh" {
  name          = "fwrule-allow-ssh22"
  network       = google_compute_network.vpcd03.id
  priority      = 1000
  direction     = "INGRESS"
  # source_ranges = ["173.61.6.206/32"]
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow SSH and ICMP only from my home IP"
  target_tags   = ["ssh-tag"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }
}

# Resource: Firewall rule - HTTP port 80
resource "google_compute_firewall" "fwhttp" {
  name          = "fwrule-allow-http80"
  network       = google_compute_network.vpcd03.id
  priority      = 1000
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  description   = "Allow HTTP from the internet"
  target_tags   = ["http-tag"]
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}


#
resource "google_compute_instance" "app1d03" {
  name         = "my-instance"
  machine_type = "e2-micro" # "n2-standard-2"
  zone         = "us-central1-a"
  #   tags = ["ssh-tag", "http-tag"]
  tags = [
    tolist(google_compute_firewall.fwssh.target_tags)[0], 
    tolist(google_compute_firewall.fwhttp.target_tags)[0]
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    # network    = google_compute_network.vpcd03.id
    subnetwork = google_compute_subnetwork.subnetd03.id
    access_config {
      // Ephemeral public IP
    }
  }
  # Webserver Installation
  metadata_startup_script = file("${path.module}/s01_nginx_app1.sh")
}


#!/bin/bash


sudo apt install -y telnet                  # Installs telnet
sudo apt install -y nginx                   # Installs Nginx
sudo systemctl start nginx                  # Start Nginx
sudo systemctl enable nginx                 # Enables Nginx
sudo chmod -R 755 /var/www/html             # Makes all files readable/executable by everyone - Writable only by the owner - Standard permission for web content
sudo mkdir -p /var/www/html/nginxapp1       # Creates a custom directory /var/www/html/nginxapp1
HOSTNAME=$(hostname)

# Generates two HTML pages (one inside the app folder, one at the root) - Displays hostname, IP address, and version dynamically
sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(250, 210, 210);'> <h1>Welcome to TchatuaIaC - Nginx App1 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Lab</p> </body></html>" | sudo tee /var/www/html/nginxapp1/index.html
sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(250, 210, 210);'> <h1>Welcome to TchatuaIaC - Nginx App1 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Lab</p> </body></html>" | sudo tee /var/www/html/index.html





