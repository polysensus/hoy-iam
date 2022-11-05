locals {
  # this is the workload identity base for the cluster. All workload identities
  # are constructed from this - thats how they work.
  workloadid_fqdn = "serviceAccount:${data.google_container_cluster.project.project}.svc.id.goog"
}
