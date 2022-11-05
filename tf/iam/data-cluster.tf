data "google_container_cluster" "project" {
  # data describing the cluster hosting this project
  project = var.cluster_project_id
  name = var.cluster_name
  location = var.cluster_location
}
