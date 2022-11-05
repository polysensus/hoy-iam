# ----------------------------------------------------------------------------- 
# workload identity for the apikeystore k8s service account
#
# GCP workload identity authorization for workloads works by annotating a
# kubernentes service account so that it refers to a gcp service account
# principal.
# -----------------------------------------------------------------------------

resource "kubernetes_service_account_v1" "apikeystore-sa" {
  metadata {
    name = "apikeystore-sa"
    namespace = "${var.firestore_service_namespace}"
    annotations = {
      "iam.gke.io/gcp-service-account" = "apikeystore-sa@${var.project_id}.iam.gserviceaccount.com"
    }
  }
}

resource "google_service_account" "apikeystore" {
  account_id   = "apikeystore-sa"
  display_name = substr("Workload Identity ${local.workloadid_fqdn}[${var.firestore_service_namespace}/apikeystore-sa]", 0, 100)
  project      = var.project_id
}

