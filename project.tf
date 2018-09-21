provider "google" {
  region      = "${var.region}"
  credentials = "${file("${var.credentials_file_path}")}"
  version     = "~> 1.16"
}

resource "google_project" "proj" {
  name            = "Nested Virt Sandbox 3"
  project_id      = "tf-nestedvirt3"
  billing_account = "${var.billing_account_id}"
  org_id          = "${var.org_id}"
}

resource "google_project_services" "svcs" {
  project = "${google_project.proj.project_id}"

  services = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "oslogin.googleapis.com",
  ]
}

resource "google_project_iam_binding" "projiambinding1" {
  project = "${google_project.proj.project_id}"
  role    = "roles/editor"

  members = [
    "serviceAccount:${google_project.proj.number}-compute@developer.gserviceaccount.com",
    "serviceAccount:${google_project.proj.number}@cloudservices.gserviceaccount.com",
    "user:${var.owner}",
  ]
}

output "project_id" {
  value = "${google_project.proj.project_id}"
}

output "project_number" {
  value = "${google_project.proj.number}"
}
