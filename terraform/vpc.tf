resource "google_compute_network" "main" {
  name                    = "thehive-vpc"
  project                 = google_project.thehive.project_id
  auto_create_subnetworks = false

  depends_on = [google_project_service.services]
}

resource "google_compute_subnetwork" "gke" {
  name          = "thehive-gke-subnet"
  project       = google_project.thehive.project_id
  region        = var.region
  network       = google_compute_network.main.id
  ip_cidr_range = "10.10.0.0/20"

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.20.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.30.0.0/20"
  }
}
