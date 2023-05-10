# GCP Provider 

provider "google" {
  credentials = file(var.service_account_key_file)
  project     = var.project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}