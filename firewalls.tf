## Network Firewall Rules - webserver rules

# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "${var.app_name}-${var.environment}-fw-allow-http"
  network = google_compute_network.vpc.id
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http"] 
}

# allow https
resource "google_compute_firewall" "allow-https" {
  name    = "${var.app_name}-${var.environment}-fw-allow-https"
  network = google_compute_network.vpc.id
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["https"] 
}