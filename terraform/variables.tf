variable "org_id" {
  description = "Google Cloud organization ID."
  type        = string
  default     = "356024295871"
}

variable "billing_account" {
  description = "Billing account ID attached to the new project."
  type        = string
}

variable "project_id" {
  description = "Globally unique Google Cloud project ID to create."
  type        = string
}

variable "project_name" {
  description = "Display name for the Google Cloud project."
  type        = string
  default     = "thehive-soar"
}

variable "region" {
  description = "Google Cloud region."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud zone."
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "GKE cluster name."
  type        = string
  default     = "thehive-gke"
}

variable "node_machine_type" {
  description = "GKE node machine type. e2-standard-2 is low cost but tight; use e2-standard-4 or larger for serious testing."
  type        = string
  default     = "e2-standard-2"
}

variable "node_count" {
  description = "Number of GKE nodes in the default node pool."
  type        = number
  default     = 1
}

variable "disk_size_gb" {
  description = "Boot disk size per GKE node."
  type        = number
  default     = 50
}

variable "thehive_namespace" {
  description = "Kubernetes namespace for TheHive."
  type        = string
  default     = "thehive"
}
