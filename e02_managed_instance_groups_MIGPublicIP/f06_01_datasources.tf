data "google_compute_image" "my_image" {
  #Debian
  project = "debian-cloud"
  family  = "debian-12"

  /*
  # CentOs
  project = "centos-cloud"  
  family  = "centos-stream-9"

  # RedHat
  project = "rhel-cloud" 
  family  = "rhel-9"
  
  # Ubuntu
  project = "ubuntu-os-cloud"
  family  = "ubuntu-2004-lts"

  # Microsoft
  project = "windows-cloud"
  family  = "windows-2022"

  # Rocky Linux
  project = "rocky-linux-cloud"
  family  = "rocky-linux-8"
  */
}

/*
Terraform Datasources
    google_compute_zones: Provides access to available Google Compute zones in a region for a given project. 
    Argument Reference:
        project
        region
        status: Status can be either UP or DOWN
    Attributes Reference:
        names - A list of zones available in the given region
*/

data "google_compute_zones" "available" {
  status = "UP"
}

output "compute_zone_name" {
  description = "List of compute zones"
  value       = data.google_compute_zones.available.names
}

