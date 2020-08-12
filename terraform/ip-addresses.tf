resource "google_compute_global_address" "frontend-ip" {
  name = "frontend-ip"
  project = "daniscarpa"
}

resource "google_compute_global_address" "monitoring-ip" {
  name = "monitoring-ip"
  project = "daniscarpa"
}