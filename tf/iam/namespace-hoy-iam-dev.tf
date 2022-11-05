resource "kubernetes_namespace_v1" "project" {
  metadata {
    name = "${var.project_name}"
    labels = {
      name = "${var.project_name}"
    }
  }
}
