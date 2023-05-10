# Outputs

output "web_server_name" {
  value = google_compute_instance.web_server.name
}

output "web_server-URL" {
 value = join("",["http://",google_compute_instance.web_server.network_interface.0.access_config.0.nat_ip,":80"])
}

output "vm-external-ip" {
  value = google_compute_instance.web_server.network_interface.0.access_config.0.nat_ip
}