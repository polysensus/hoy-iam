resource "google_service_account_iam_member" "apikeystore_workloadidentityuser_role" {
  service_account_id = google_service_account.apikeystore.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "${local.workloadid_fqdn}[${var.firestore_service_namespace}/apikeystore-sa]"
}

# Add the reader role to the sa
resource "google_project_iam_member" "datastore_reader_role" {

  depends_on = [google_project_iam_custom_role.datastore_reader_role]
  project = var.project_id
  role = "projects/${var.project_id}/roles/datastore_reader"
  member = "serviceAccount:${google_service_account.apikeystore.email}"
}

# Add the writer role to the sa
resource "google_project_iam_member" "datastore_writer_role" {

  depends_on = [google_project_iam_custom_role.datastore_writer_role]
  project = var.project_id
  role = "projects/${var.project_id}/roles/datastore_writer"
  member = "serviceAccount:${google_service_account.apikeystore.email}"
}
