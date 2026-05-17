# Connect to the VM

## From Google Shell

```t
gcloud config set project a01-terraform-project

gcloud compute ssh --zone "us-central1-a" "my-instance" --project "a01-terraform-project"

```

## From my local terminal

- Install Telnet on Windows (Step‑by‑Step)

    - Open Windows Features
    - Telnet is disabled by default in Windows and must be enabled as an optional feature.
        - Press Win + R → type optionalfeatures → press Enter
        - A window called Windows Features will open
        - Scroll down to find Telnet Client

```t

```


```t
3_terraform_language_basics (d02_terraform_commands)
$ terraform state list
google_compute_firewall.fwhttp
google_compute_firewall.fwssh
google_compute_instance.app1d03
google_compute_network.vpcd03
google_compute_subnetwork.subnetd03


$ terraform state show google_compute_instance.app1d03
# google_compute_instance.app1d03:
resource "google_compute_instance" "app1d03" {
    can_ip_forward          = false
    cpu_platform            = "Intel Broadwell"
    current_status          = "RUNNING"
    deletion_protection     = false
    description             = null
    effective_labels        = {}
    enable_display          = false
    guest_accelerator       = []
    hostname                = null
    id                      = "projects/a01-terraform-project/zones/us-central1-a/instances/my-instance"
    instance_id             = "91992447254798310"
    label_fingerprint       = "42WmSpB8rSM="
    machine_type            = "e2-micro"
    metadata_fingerprint    = "uCOcjkF9G94="
    metadata_startup_script = <<-EOT
        #!/bin/bash
        sudo apt install -y telnet
        sudo apt install -y nginx
        sudo systemctl enable nginx
        sudo chmod -R 755 /var/www/html
        sudo mkdir -p /var/www/html/app1
        HOSTNAME=$(hostname)
        sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(250, 210, 210);'> <h1>Welcome to StackSimplify - WebVM App1 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Demos</p> </body></html>" | sudo tee /var/www/html/app1/index.html
        sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(250, 210, 210);'> <h1>Welcome to StackSimplify - WebVM App1 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Demos</p> </body></html>" | sudo tee /var/www/html/index.html
    EOT
    min_cpu_platform        = null
    name                    = "my-instance"
    project                 = "a01-terraform-project"
    self_link               = "https://www.googleapis.com/compute/v1/projects/a01-terraform-project/zones/us-central1-a/instances/my-instance"
    tags                    = [
        "http-tag",
        "ssh-tag",
    ]
    tags_fingerprint        = "QXaoAjXxJ7Q="
    terraform_labels        = {}
    zone                    = "us-central1-a"

    boot_disk {
        auto_delete                = true
        device_name                = "persistent-disk-0"
        disk_encryption_key_raw    = (sensitive value)
        disk_encryption_key_sha256 = null
        kms_key_self_link          = null
        mode                       = "READ_WRITE"
        source                     = "https://www.googleapis.com/compute/v1/projects/a01-terraform-project/zones/us-central1-a/disks/my-instance"

        initialize_params {
            enable_confidential_compute = false
            image                       = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-12-bookworm-v20260513"
            labels                      = {}
            provisioned_iops            = 0
            provisioned_throughput      = 0
            size                        = 10
            type                        = "pd-standard"
        }
    }

    network_interface {
        internal_ipv6_prefix_length = 0
        ipv6_access_type            = null
        ipv6_address                = null
        name                        = "nic0"
        network                     = "https://www.googleapis.com/compute/v1/projects/a01-terraform-project/global/networks/vpc-d03"
        network_ip                  = "10.2.0.5"
        nic_type                    = null
        queue_count                 = 0
        stack_type                  = "IPV4_ONLY"
        subnetwork                  = "https://www.googleapis.com/compute/v1/projects/a01-terraform-project/regions/us-central1/subnetworks/subnet-d03"
        subnetwork_project          = "a01-terraform-project"

        access_config {
            nat_ip                 = "34.66.47.152"
            network_tier           = "PREMIUM"
            public_ptr_domain_name = null
        }
    }

    scheduling {
        automatic_restart           = true
        instance_termination_action = null
        min_node_cpus               = 0
        on_host_maintenance         = "MIGRATE"
        preemptible                 = false
        provisioning_model          = "STANDARD"
    }

    shielded_instance_config {
        enable_integrity_monitoring = true
        enable_secure_boot          = false
        enable_vtpm                 = true
    }
}
```