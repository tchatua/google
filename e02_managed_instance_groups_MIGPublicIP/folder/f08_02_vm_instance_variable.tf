# Defining a map with zone as key and machine_type as value
variable "zone_machine_map" {
  description = "map with zone as key and machine_type as value"
  default = {
    "us-central1-a" = "e2-micro"
    "us-central1-b" = "e2-small"
    "us-central1-c" = "e2-medium"
  }
}

