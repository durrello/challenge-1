## Network - VPC & subnets

resource "google_compute_network" "vpc" {
  name                    = "${var.app_name}-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "network_subnet" {
  name          = "${var.app_name}-${var.environment}-subnet"
  ip_cidr_range = var.network-subnet-cidr
  region        = var.gcp_region
  network       = google_compute_network.vpc.id
}
