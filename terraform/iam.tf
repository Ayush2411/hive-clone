resource "google_service_account" "gke_nodes" {
  project      = google_project.thehive.project_id
  account_id   = "thehive-gke-nodes"
  display_name = "TheHive GKE node service account"
}

resource "google_project_iam_member" "gke_nodes_logging" {
  project = google_project.thehive.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gke_nodes.email}"
}

resource "google_project_iam_member" "gke_nodes_monitoring" {
  project = google_project.thehive.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.gke_nodes.email}"
}

resource "google_service_account" "thehive_workload" {
  project      = google_project.thehive.project_id
  account_id   = "thehive-workload"
  display_name = "TheHive workload identity service account"
}

resource "google_service_account_iam_member" "thehive_workload_identity" {
  service_account_id = google_service_account.thehive_workload.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.thehive_namespace}/thehive]"

  depends_on = [google_container_cluster.primary]
}
