variable "region" {
  default = "us-west1"
}

variable "region_zone" {
  default = "us-west1-b"
}

variable "org_id" {
  default     = 111111111111
}

variable "billing_account_id" {
  default     = "000000-000000-000000"
}

variable "credentials_file_path" {
  description = "auser-admin1 is project name constructed from $USER-admin1"
  default     = "~/.gcloud/auser-admin1.json"
}

variable "owner" {
  description = "The owner of the organization. I use auser@example.com to log into cloud.google.com"
  default = "auser@example.com"
}
