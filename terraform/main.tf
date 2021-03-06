resource "google_container_cluster" "primary" {
  name     = "daniscarpa-cluster"
  location = "europe-west6-a"
  project = "daniscarpa"

  remove_default_node_pool = true
  initial_node_count = 3

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "daniscarpa-nodepool"
  project = "daniscarpa"
  location   = "europe-west6-a"
  cluster    = google_container_cluster.primary.name
  node_count = 2
  
  autoscaling {
    min_node_count = 0
    max_node_count = 3
  }

  node_config {
    preemptible  = true
    machine_type = "n1-standard-2"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }
}
