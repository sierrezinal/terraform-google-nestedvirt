resource "google_compute_instance" "vm" {
  project                   = "${google_project_services.svcs.project}"
  name                      = "vm1"
  machine_type              = "n1-standard-1"
  zone                      = "${var.region_zone}"
  allow_stopping_for_update = true
  min_cpu_platform          = "Intel Broadwell"

  boot_disk {
    initialize_params {
      image = "${google_project.proj.project_id}/debian-9"
    }
  }

  tags = ["vmx"]

  metadata_startup_script = "${file("scripts/install.sh")}"

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

output "ip" {
  value = "${google_compute_instance.vm.network_interface.0.access_config.0.assigned_nat_ip}"
}
