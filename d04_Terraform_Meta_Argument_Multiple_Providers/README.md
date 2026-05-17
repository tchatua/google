#

##

```t
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_network.vpcd04 will be created
  + resource "google_compute_network" "vpcd04" {
      + auto_create_subnetworks                   = false
      + delete_default_routes_on_create           = false
      + gateway_ipv4                              = (known after apply)
      + id                                        = (known after apply)
      + internal_ipv6_range                       = (known after apply)
      + mtu                                       = (known after apply)
      + name                                      = "vpc-d04"
      + network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
      + numeric_id                                = (known after apply)
      + project                                   = "a01-terraform-project"
      + routing_mode                              = (known after apply)
      + self_link                                 = (known after apply)
    }

  # google_compute_subnetwork.subnetcentral1d04 will be created
  + resource "google_compute_subnetwork" "subnetcentral1d04" {
      + creation_timestamp         = (known after apply)
      + external_ipv6_prefix       = (known after apply)
      + fingerprint                = (known after apply)
      + gateway_address            = (known after apply)
      + id                         = (known after apply)
      + internal_ipv6_prefix       = (known after apply)
      + ip_cidr_range              = "10.3.0.0/16"
      + ipv6_cidr_range            = (known after apply)
      + name                       = "subnet-d04"
      + network                    = (known after apply)
      + private_ip_google_access   = (known after apply)
      + private_ipv6_google_access = (known after apply)
      + project                    = "a01-terraform-project"
      + purpose                    = (known after apply)
      + region                     = (known after apply)
      + secondary_ip_range         = (known after apply)
      + self_link                  = (known after apply)
      + stack_type                 = (known after apply)
    }

  # google_compute_subnetwork.subneteast1d04 will be created
  + resource "google_compute_subnetwork" "subneteast1d04" {
      + creation_timestamp         = (known after apply)
      + external_ipv6_prefix       = (known after apply)
      + fingerprint                = (known after apply)
      + gateway_address            = (known after apply)
      + id                         = (known after apply)
      + internal_ipv6_prefix       = (known after apply)
      + ip_cidr_range              = "10.4.0.0/16"
      + ipv6_cidr_range            = (known after apply)
      + name                       = "subnet-d04"
      + network                    = (known after apply)
      + private_ip_google_access   = (known after apply)
      + private_ipv6_google_access = (known after apply)
      + project                    = "a01-terraform-project"
      + purpose                    = (known after apply)
      + region                     = (known after apply)
      + secondary_ip_range         = (known after apply)
      + self_link                  = (known after apply)
      + stack_type                 = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.
──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these
actions if you run "terraform apply" now.
```