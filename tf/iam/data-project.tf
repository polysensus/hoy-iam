data "google_client_config" "provider" {}

provider "kubernetes" {
  host = "https://${data.google_container_cluster.project.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.project.master_auth[0].cluster_ca_certificate,
  )
}

provider "helm" {
  kubernetes {
    host = "https://${data.google_container_cluster.project.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.project.master_auth[0].cluster_ca_certificate,
    )
  }
}
