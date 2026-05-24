#
resource "google_compute_instance_from_template" "app1" {
  # Meta-Argument: for_each
  for_each = var.zone_machine_map
  # name         = "${var.compute_instance_name}-${each.key}-${each.value}"
  name                     = "${local.name}-${each.key}-app1-vm"
  machine_type             = each.value
  zone                     = each.key # I can also use each.value because for list items each.key == each.value
  source_instance_template = google_compute_region_instance_template.app1.self_link
}
