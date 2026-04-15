locals {
  labels = {
    app         = "thehive"
    managed-by  = "terraform"
    environment = "lab"
  }

  services = [
    "artifactregistry.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "serviceusage.googleapis.com",
    "storage.googleapis.com"
  ]

  attachment_bucket_name = "${var.project_id}-thehive-attachments"
}
