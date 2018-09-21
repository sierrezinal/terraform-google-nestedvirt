terraform {
  backend "gcs" {
    bucket  = "auser-admin1"
    prefix  = "terraform/state"
    project = "auser-admin1"
  }
}
