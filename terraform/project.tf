resource "google_project" "thehive" {
  name            = var.project_name
  project_id      = var.project_id
  org_id          = var.org_id
  billing_account = var.billing_account
  labels          = local.labels
}

resource "google_project_service" "services" {
  for_each = toset(local.services)

  project = google_project.thehive.project_id
  service = each.value

  disable_dependent_services = true
  disable_on_destroy         = false
}
