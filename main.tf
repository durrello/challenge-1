## GCP Linux VM - Web server

# Script to deploy webserver Apache
data "template_file" "linux-metadata" {
template = <<EOF
sudo apt-get update; 
sudo apt-get install -yq build-essential apache2;
sudo systemctl start apache2;
sudo systemctl enable apache2;
EOF
}

## GCP instance
resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "n1-standard-1"
  zone         = var.gcp_zone
  tags         = ["web-firewall"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  # Run Script
  metadata_startup_script = data.template_file.linux-metadata.rendered

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config { }
  }
}


## Network & load balancer

# Allow http
resource "google_compute_firewall" "web-firewall" {
  project = var.project_id
  name    = "${var.app_name}-${var.environment}-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["web-firewall"] 
}

# Health check
resource "google_compute_http_health_check" "health_check" {
  name               = "web-health-check"
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2
  port               = 80
  request_path       = "/"
}

# Load balancer
resource "google_compute_target_pool" "target_pool" {
  name           = "web-target-pool"
  instances      = [google_compute_instance.web_server.self_link]
  health_checks  = [google_compute_http_health_check.health_check.self_link]
  session_affinity = "NONE"
}

resource "google_compute_forwarding_rule" "forwarding_rule" {
  name                  = "web-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  target                = google_compute_target_pool.target_pool.self_link
  port_range            = "80-80"

}

