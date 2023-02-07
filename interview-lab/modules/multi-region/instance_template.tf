resource "google_compute_instance_template" "instance_template" {
  name        = var.name
  description = var.instance_template_description

  tags = var.tags

  labels = {
    service = var.name
  }

  metadata = {
    block-project-ssh-keys = true
  }

  instance_description    = var.instance_description
  machine_type            = var.machine_type
  can_ip_forward          = false
  metadata_startup_script = file("./startup/script.sh")

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "debian-cloud/debian-10"
    boot         = true
    disk_type    = "pd-balanced"
  }

  network_interface {
    network    = data.google_compute_network.network.name
    subnetwork = data.google_compute_subnetwork.subnet.name
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = resource.google_service_account.sa.email
    scopes = ["cloud-platform"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
