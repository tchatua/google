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
