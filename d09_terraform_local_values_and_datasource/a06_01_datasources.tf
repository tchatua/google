/*
Terraform Datasources
  google_compute_zones: Provides access to available Google Compute zones that are UP in a region for a given project. 
  Argument Reference:
      project
      region
      status: Status can be either UP or DOWN
  Attributes Reference:
      names - A list of zones available in the given region
*/ /*
data "google_compute_zones" "available" {
  status = "UP"
}

# output value
output "compute_zone_name" {
  description = "List of compute zones"
  value       = data.google_compute_zones.available.names
}
*/

/*
Datasource: Get information about a Google Compute Image
  google_compute_image: Represents an Image resource
    Google Compute Engine uses operating system images to create the root persistent disks for my instances. 
    I specify an image when I create an instance. 
    Images contain a boot loader, an operating system, and a root file system. 
    Linux operating system images are also capable of running containers on Compute Engine.
    
    Images can be either public or custom.
      Public images are provided and maintained by Google, open-source communities, and third-party vendors. 
      By default, all projects have access to these images and can use them to create instances. 
      Custom images are available only to my project. 
      I can create a custom image from root persistent disks and other images. Then, use the custom image to create an instance.
*/
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
