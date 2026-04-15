output "project_id" {
  value = google_project.thehive.project_id
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}

output "attachment_bucket" {
  value = google_storage_bucket.attachments.name
}

output "thehive_workload_service_account" {
  value = google_service_account.thehive_workload.email
}

output "kubectl_connect_command" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --zone ${var.zone} --project ${google_project.thehive.project_id}"
}

output "argocd_port_forward_command" {
  value = "kubectl -n argocd port-forward svc/argocd-server 8080:443"
}
