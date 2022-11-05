# -----------------------------------------------------------------------------
# READER role for access to the project firestore. Any service account with
# this can read any contents in the store for the project
# -----------------------------------------------------------------------------
resource "google_project_iam_custom_role" "datastore_reader_role" {
  role_id = "datastore_reader"
  title   = "Document Reader Role"

  project    = var.project_id

  permissions = [
    # XXX: these are currently just the defaults for the roles/datastore.viewer.
    # TOOD try to reduce them
    "appengine.applications.get",
    "datastore.databases.get",
    "datastore.entities.get",
    "datastore.entities.list",
    "datastore.indexes.get",
    "datastore.indexes.list",
    "datastore.namespaces.get",
    "datastore.namespaces.list",
    "datastore.statistics.get",
    "datastore.statistics.list"#,
    #"resourceManager.projects.get",
    #"resourceManager.projects.list"
  ]
}

# -----------------------------------------------------------------------------
# Writer role for access to the project firestore. Any service account with
# this can read, write and delete any contents in the store for the project
# -----------------------------------------------------------------------------
resource "google_project_iam_custom_role" "datastore_writer_role" {
  role_id = "datastore_writer"
  title   = "Document Writer Role"

  project    = var.project_id

  # XXX: these are currently just the defaults for the roles/datastore.user.
  # TOOD try to reduce them

  permissions = [
    "appengine.applications.get",
    "datastore.databases.get",
    "datastore.entities.get",
    "datastore.entities.list",
    "datastore.entities.create",
    "datastore.entities.update",
    "datastore.entities.delete",
    "datastore.indexes.list",
    "datastore.namespaces.get",
    "datastore.namespaces.list",
    "datastore.statistics.get",
    "datastore.statistics.list"#,
    #"resourceManager.projects.get",
    #"resourceManager.projects.list"
  ]
}
