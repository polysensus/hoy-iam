resource "google_app_engine_application" "app" {
  project = var.project_id
  location_id = var.cluster_region
  database_type = "CLOUD_FIRESTORE"
}