# GCP Variables 

variable "app_name" {
  description = "GCP Project ID"
  default     = "web-server"
}

variable "project_id" {
  description = "GCP Project ID"
  default     = "intense-acrobat-280812"
}

variable "service_account_key_file" {
  description = "Path to the service account key file"
  default     = "./intense-acrobat-280812-4eb38da07159.json"
}

variable "gcp_region" {
  description = "GCP region"
  default = "us-central1"
}

variable "gcp_zone" {
  type        = string
  default = "us-central1-a"
  description = "GCP zone"
}

variable "environment" {
  type        = string
  default = "dev"
}

variable "network-subnet-cidr" {
  type        = string
  default = "10.0.1.0/24"
}

